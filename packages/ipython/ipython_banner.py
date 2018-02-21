#!/usr/bin/env python
# -*- coding: utf-8 -*-

from past.builtins import range


def paint_ipy_banner():
    """Create a colored IPython Banner.

    Banner looks like this:

    XXXXXX  XXXXX                       | Python Version Info
      XX    XX  XX  XXXX __    __ XXXX  | IPython Version Info
      XX    XX  XX  XX   \ \  / /   XX  | Help
      XX    XXXXX   XX    \ \/ /    XX  |
      XX    XX      XX     \  /     XX  |
      XX    XX      XX    _/ /      XX  |
    XXXXXX  XX      XXXX |__/     XXXX  |

    The X symbols are not literal, but merely placeholders representing the
    occupying space of each banner character. The background is highlighted in
    their place.
    """
    from IPython import InteractiveShell

    fg_black = "\x1B[38;5;232m"
    fg_white = "\x1B[0;37m"
    fg_default = "\x1B[0;39m"

    bg_black = "\x1B[48;5;232m"
    bg_blue = "\x1B[0;44m"
    bg_default = "\x1B[0;49m"

    # Cache some common patterns for speed
    two_black_cells = bg_black + '  ' + bg_default
    five_black_cells = bg_black + '     ' + bg_default
    six_black_cells = bg_black + '      ' + bg_default
    two_blue_cells = bg_blue + '  ' + bg_default
    four_blue_cells = bg_blue + '    ' + bg_default

    I_symbol = [six_black_cells,
                '  ' + two_black_cells + '  ',
                '  ' + two_black_cells + '  ',
                '  ' + two_black_cells + '  ',
                '  ' + two_black_cells + '  ',
                '  ' + two_black_cells + '  ',
                six_black_cells]

    P_symbol = [five_black_cells + ' ',
                two_black_cells + '  ' + two_black_cells,
                two_black_cells + '  ' + two_black_cells,
                five_black_cells + ' ',
                two_black_cells + '    ',
                two_black_cells + '    ',
                two_black_cells + '    ']

    left_bracket_symbol = ['    ',
                           four_blue_cells,
                           two_blue_cells + '  ',
                           two_blue_cells + '  ',
                           two_blue_cells + '  ',
                           two_blue_cells + '  ',
                           four_blue_cells]

    right_bracket_symbol = ['    ',
                            four_blue_cells,
                            '  ' + two_blue_cells,
                            '  ' + two_blue_cells,
                            '  ' + two_blue_cells,
                            '  ' + two_blue_cells,
                            four_blue_cells]

    y_symbol = [fg_black + '        ' + fg_default,
                fg_black + '__    __' + fg_default,
                fg_black + '\ \  / /' + fg_default,
                fg_black + ' \ \/ / ' + fg_default,
                fg_black + '  \  /  ' + fg_default,
                fg_black + ' _/ /   ' + fg_default,
                fg_black + '|__/    ' + fg_default]

    split_bar = [fg_white + "|" + fg_default] * 7

    default_banner = InteractiveShell.banner1.default_value.split("\n")
    default_banner = list(filter(None, default_banner))
    rows = len(I_symbol)

    ipy_banner = ['{0}  {1}  {2} {3} {4}  {5} {6}'.format(
                        I_symbol[i], P_symbol[i], left_bracket_symbol[i],
                        y_symbol[i], right_bracket_symbol[i], split_bar[i],
                        default_banner[i] if i < len(default_banner) else '')
                   for i in range(rows)]
    ipy_banner = '\n' + '\n'.join(ipy_banner) + '\n'

    return ipy_banner

