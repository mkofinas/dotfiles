try:
    from rich import inspect
except Exception:
    pass

from IPython.core.magic import register_line_magic

@register_line_magic
def ins(line):
    inspect(globals()[line])

del ins
