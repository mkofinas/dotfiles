#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import yaml

with open("cfg/symlinks.yaml", 'r') as stream:
    symbolic_links = (yaml.load(stream))

current_path = os.getcwd()
for link in symbolic_links:
    print link
    link_source = os.path.join(current_path, link)
    print link_source
    link_dst = os.path.join(os.path.expanduser('~'), link)
    print link_dst
    if os.path.islink(link_dst):
        os.remove(link_dst) 
    os.symlink(link_source, link_dst)
