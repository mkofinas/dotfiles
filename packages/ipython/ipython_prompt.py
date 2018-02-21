#!/usr/bin/env python
# -*- coding: utf-8 -*-

from IPython.terminal.prompts import Prompts, Token
import os
import pwd


class IpythonPrompt(Prompts):
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

