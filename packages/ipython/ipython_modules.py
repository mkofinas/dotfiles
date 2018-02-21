#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import re
from collections import OrderedDict


def group_print_modules(imported_modules):
    """Pretty print IPython session imported modules

    Use IPython exec_lines list to notify the user about imported modules
    """
    printed_modules = OrderedDict()
    pattern = '(from (\S+) )?import ((\S+)( as (\w+))?)'
    for it in imported_modules:
        g = re.match(pattern, it)
        assert g, 'Invalid import'
        if g.group(2):
            if g.group(2) not in printed_modules:
                printed_modules[g.group(2)] = []
            printed_modules[g.group(2)].append(g.group(3))
        else:
            printed_modules[g.group(4)] = g.group(3)

    l = 'Import Modules:\n'
    for name, modules in printed_modules.items():
        if isinstance(modules, list):
            l += '|-> {0} ({1})\n'.format(name, ', '.join(modules))
        else:
            l += '|-> {0}\n'.format(modules)
    return l
