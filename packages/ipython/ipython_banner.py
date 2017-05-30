#!/usr/bin/env python
# -*- coding: utf-8 -*-


def paint_ipy_banner():
    """
    Create a colored IPython Banner.
    """
    from IPython import InteractiveShell

    fg_black = "\x1B[38;5;232m"
    fg_white = "\x1B[0;37m"
    fg_default = "\x1B[0;39m"

    bg_black = "\x1B[48;5;232m"
    bg_blue = "\x1B[0;44m"
    bg_white = "\x1B[0;47m"
    bg_default = "\x1B[0;49m"

    I_symbol = ["111111",
                "001100",
                "001100",
                "001100",
                "001100",
                "001100",
                "111111"]

    P_symbol = ["111110",
                "110011",
                "110011",
                "111110",
                "110000",
                "110000",
                "110000"]

    left_parens_symbol = ["0000",
                          "1111",
                          "1100",
                          "1100",
                          "1100",
                          "1100",
                          "1111"]

    right_parens_symbol = ["0000",
                           "1111",
                           "0011",
                           "0011",
                           "0011",
                           "0011",
                           "1111"]

    y_symbol = ["        ",
                "__    __",
                "\ \  / /",
                " \ \/ / ",
                "  \  /  ",
                " _/ /   ",
                "|__/    "]

    default_banner = InteractiveShell.banner1.default_value.split("\n")
    default_banner = list(filter(None, default_banner))

    rows = len(I_symbol)
    ipy_banner = ['' for ii in range(rows)]
    for ii in range(rows):
        ipy_banner[ii] += ''.join([bg_black * int(jj) + ' ' + bg_default for jj in I_symbol[ii]])
        ipy_banner[ii] += "  "
        ipy_banner[ii] += ''.join([bg_black * int(jj) + ' ' + bg_default for jj in P_symbol[ii]])
        ipy_banner[ii] += "  "
        ipy_banner[ii] += ''.join([bg_blue * int(jj) + ' ' + bg_default for jj in left_parens_symbol[ii]])
        ipy_banner[ii] += " "
        ipy_banner[ii] += ''.join([fg_black + jj + fg_default for jj in y_symbol[ii]])
        ipy_banner[ii] += " "
        ipy_banner[ii] += ''.join([bg_blue * int(jj) + ' ' + bg_default for jj in right_parens_symbol[ii]])
        ipy_banner[ii] += "  "
        ipy_banner[ii] += fg_white + "| " + default_banner[ii] + fg_default
    return "\n" + '\n'.join(ipy_banner) + "\n"

print(paint_ipy_banner())

