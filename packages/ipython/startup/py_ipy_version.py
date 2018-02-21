#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function


def py_ipy_version():
    """Pretty print Python and IPython versions."""
    from sys import version_info as py_version_info
    from IPython import version_info as ipy_version_info
    from IPython.utils.coloransi import TermColors

    py_versions = []

    py_version = u'.'.join([str(ii) for ii in py_version_info[:3]])
    ipy_version = u'.'.join([str(ii) for ii in ipy_version_info
                             if isinstance(ii, int)])

    py_symbol = u'{0} {1}'.format('\x1b[0;33m', TermColors.Normal)
    ipy_symbol = u'{0}IP{1}{2}[{1}{0}y{1}{2}]{1}'.format(
            '\x1B[38;5;232m', TermColors.Normal, TermColors.LightBlue)

    py_versions.append((py_symbol, py_version))
    py_versions.append((ipy_symbol, ipy_version))

    for item in py_versions:
        print(u'{}: {}'.format(item[0], item[1]))
