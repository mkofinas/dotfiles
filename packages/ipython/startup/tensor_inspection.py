import IPython
from IPython.core.magic import register_line_magic
from numpy import ndarray
from torch import Tensor

from rich.table import Table
from rich.console import Console


@register_line_magic
def tins(inp):
    """Tensor Inspection Line Magic"""
    m = IPython.core.magics.namespace.NamespaceMagics(IPython.get_ipython())

    who_list = m.who_ls()
    who_info = []
    for k in who_list:
        if isinstance(v := globals()[k], (Tensor, ndarray)):
            who_info.append((k, tuple(v.shape), v.dtype))
    table = Table(show_header=True, header_style="bold")
    table.add_column("Name", style="dim", justify="right")
    table.add_column("Size", style="dim", justify="right")
    table.add_column("Type", style="dim", justify="right")
    for x in who_info:
        table.add_row(*[str(xi) for xi in x])
    if table._row_count:
        Console().print(table)
    # return table


del tins
