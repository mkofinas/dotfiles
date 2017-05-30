#!/usr/bin/env python
# -*- coding: utf-8 -*-

from IPython.terminal.prompts import Prompts, Token
from IPython.utils.coloransi import TermColors, InputTermColors, ColorScheme
import os
import pwd

class IpythonPrompt(Prompts):
    # # Output prompt. '\#' will be transformed to the prompt number
    # c.PromptManager.out_template = u'{color.Brown} {color.Red}│⟶  '

    # # Continuation prompt.
    # c.PromptManager.in2_template = u'{color.Brown} {color.Green}│⟶  '

    # #
    # c.PromptManager.color_scheme = 'Linux'

    # # Input prompt.  '\#' will be transformed to the prompt number
    # c.PromptManager.in_template = u'{color.Brown} ' + \
                              # r'{color.Cyan}\u{color.Brown}:'\
                               # '{color.LightRed}[{color.Red}\Y1{color.LightRed}]\n' + \
                               # u'{color.Brown} {color.Green}│⟶  '

    # # If True (default), each prompt will be right-aligned with the preceding one.
    # c.PromptManager.justify = False
    def in_prompt_tokens(self, cli=None):
        return [(Token.Number, u' '),
                (Token.String, pwd.getpwuid(os.getuid())[0]),
                (Token.Number, ':'),
                (Token.OutPrompt, '['),
                (Token.OutPromptNum, os.getcwd()),
                (Token.OutPrompt, ']\n'),
                (Token.Number, u' '),
                (Token.Prompt, u'│⟶  ')]

    def continuation_prompt_tokens(self, cli=None, width=None):
        return [(Token.Number, u' '),
                (Token.Prompt, u'│⟶  ')]

    def out_prompt_tokens(self):
        return [(Token.Number, u' '),
                (Token.OutPrompt, u'│⟶  ')]


