import IPython
from IPython.core.magic import register_line_magic
from numpy import ndarray, asarray
from torch import Tensor


@register_line_magic
def tins(inp):
    """Tensor Inspection Line Magic"""
    m = IPython.core.magics.namespace.NamespaceMagics(IPython.get_ipython())

    who_list = m.who_ls()
    if not who_list:
        return

    columns = ["Name", "Size", "Type", "Device"]
    column_widths = [[len(c) for c in columns]]

    who_info = []
    for k in who_list:
        v = globals()[k]
        if isinstance(v, (Tensor, ndarray)):
            who_info.append((k, "×".join(str(si) for si in v.shape), v.dtype,
                             str(v.device) if hasattr(v, "device") else "-"))
            column_widths.append([len(str(s)) for s in who_info[-1]])

    column_widths = asarray(column_widths)
    max_column_widths = column_widths.max(0) + 2

    non_empty_columns = column_widths[1:].max(0) != 0

    table_format = ' '.join(f"{{:>{c}}}"
                            for c in max_column_widths[non_empty_columns])
    separator = "─" * (sum(max_column_widths[non_empty_columns])
                       + len(max_column_widths[non_empty_columns]) + 1)

    print(table_format.format(*[str(s) for s in columns]))
    print(separator)
    for row in who_info:
        print(table_format.format(*[str(s) for s in row]))
    print(separator)


del tins
