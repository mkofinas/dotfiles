#!/usr/bin/env python
# -*- coding: utf-8 -*-

devicons_start = "e700"
devicons_end = "e7c5"

print "Devicons"
for ii in xrange(int(devicons_start, 16), int(devicons_end, 16) + 1):
    print unichr(ii),

custom_start = "e600"
custom_end = "e621"

print "\nCustom"
for ii in xrange(int(custom_start, 16), int(custom_end, 16) + 1):
    print unichr(ii),

font_awesome_start = "f000"
font_awesome_end = "f280"

print "\nFont Awesome"
for ii in xrange(int(font_awesome_start, 16), int(font_awesome_end, 16) + 1):
    print unichr(ii),

powerline_start = "e0a0"
powerline_end = "e0d4"

print "\nPowerline"
for ii in xrange(int(powerline_start, 16), int(powerline_end, 16) + 1):
    print unichr(ii),
