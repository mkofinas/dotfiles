#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function


def py_ipy_version():
    """
    Pretty print Python and IPython versions.
    """
    from sys import version_info as py_version_info
    from IPython import version_info as ipy_version_info
    from IPython.core.prompts import Colors

    py_versions = []

    py_version = '.'.join([str(ii) for ii in py_version_info[0:3]])
    ipy_version = '.'.join([str(ii) for ii in ipy_version_info if ii])

    py_symbol = Colors.Yellow + " " + Colors.Normal
    ipy_symbol = (Colors.Black + "IP" + Colors.LightBlue + "[" +
                  Colors.Black + "y" + Colors.LightBlue + "]" +
                  Colors.Normal)

    py_versions.append((py_symbol, py_version))
    py_versions.append((ipy_symbol, ipy_version))

    print("")
    for item in py_versions:
        print(str.format("{}: {}", item[0], item[1]))
