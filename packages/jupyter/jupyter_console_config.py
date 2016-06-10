#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Configuration file for jupyter-console.

#------------------------------------------------------------------------------
# Configurable configuration
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# LoggingConfigurable configuration
#------------------------------------------------------------------------------

# A parent class for Configurables that log.
# 
# Subclasses have a log trait, and the default behavior is to get the logger
# from the currently running Application.

#------------------------------------------------------------------------------
# ConnectionFileMixin configuration
#------------------------------------------------------------------------------

# Mixin for configurable classes that work with connection files

# JSON file in which to store connection info [default: kernel-<pid>.json]
# 
# This file will contain the IP, ports, and authentication key needed to connect
# clients to this kernel. By default, this file will be created in the security
# dir of the current profile, but can be specified by absolute path.
# c.ConnectionFileMixin.connection_file = ''

# set the control (ROUTER) port [default: random]
# c.ConnectionFileMixin.control_port = 0

# set the heartbeat port [default: random]
# c.ConnectionFileMixin.hb_port = 0

# set the iopub (PUB) port [default: random]
# c.ConnectionFileMixin.iopub_port = 0

# Set the kernel's IP address [default localhost]. If the IP address is
# something other than localhost, then Consoles on other machines will be able
# to connect to the Kernel, so be careful!
# c.ConnectionFileMixin.ip = u''

# set the shell (ROUTER) port [default: random]
# c.ConnectionFileMixin.shell_port = 0

# set the stdin (ROUTER) port [default: random]
# c.ConnectionFileMixin.stdin_port = 0

# 
# c.ConnectionFileMixin.transport = 'tcp'

#------------------------------------------------------------------------------
# JupyterConsoleApp configuration
#------------------------------------------------------------------------------

# Set to display confirmation dialog on exit. You can always use 'exit' or
# 'quit', to force a direct exit without any confirmation.
# c.JupyterConsoleApp.confirm_exit = True

# Connect to an already running kernel
# c.JupyterConsoleApp.existing = ''

# The name of the default kernel to start.
# c.JupyterConsoleApp.kernel_name = 'python'

# Path to the ssh key to use for logging in to the ssh server.
# c.JupyterConsoleApp.sshkey = ''

# The SSH server to use to connect to the kernel.
# c.JupyterConsoleApp.sshserver = ''

#------------------------------------------------------------------------------
# SingletonConfigurable configuration
#------------------------------------------------------------------------------

# A configurable that only allows one instance.
# 
# This class is for classes that should only have one instance of itself or
# *any* subclass. To create and retrieve such a class use the
# :meth:`SingletonConfigurable.instance` method.

#------------------------------------------------------------------------------
# Application configuration
#------------------------------------------------------------------------------

# This is an application.

# The date format used by logging formatters for %(asctime)s
# c.Application.log_datefmt = '%Y-%m-%d %H:%M:%S'

# The Logging format template
# c.Application.log_format = '[%(name)s]%(highlevel)s %(message)s'

# Set the log level by value or name.
# c.Application.log_level = 30

#------------------------------------------------------------------------------
# JupyterApp configuration
#------------------------------------------------------------------------------

# Base class for Jupyter applications

# Answer yes to any prompts.
# c.JupyterApp.answer_yes = False

# Full path of a config file.
# c.JupyterApp.config_file = u''

# Specify a config file to load.
# c.JupyterApp.config_file_name = u''

# Generate default config file.
# c.JupyterApp.generate_config = False

#------------------------------------------------------------------------------
# ZMQTerminalIPythonApp configuration
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# InteractiveShell configuration
#------------------------------------------------------------------------------

# An enhanced, interactive shell for Python.

# 'all', 'last', 'last_expr' or 'none', specifying which nodes should be run
# interactively (displaying output from expressions).
# c.InteractiveShell.ast_node_interactivity = 'last_expr'

# A list of ast.NodeTransformer subclass instances, which will be applied to
# user input before code is run.
# c.InteractiveShell.ast_transformers = []

# Make IPython automatically call any callable object even if you didn't type
# explicit parentheses. For example, 'str 43' becomes 'str(43)' automatically.
# The value can be '0' to disable the feature, '1' for 'smart' autocall, where
# it is not applied if there are no more arguments on the line, and '2' for
# 'full' autocall, where all callable objects are automatically called (even if
# no arguments are present).
# c.InteractiveShell.autocall = 0

# Autoindent IPython code entered interactively.
c.InteractiveShell.autoindent = True

# Enable magic commands to be called without the leading %.
# c.InteractiveShell.automagic = True

# The part of the banner to be printed before the profile
# c.InteractiveShell.banner1 = 'Python 2.7.6 (default, Jun 22 2015, 17:58:13) \nType "copyright", "credits" or "license" for more information.\n\nIPython 4.1.1 -- An enhanced Interactive Python.\n?         -> Introduction and overview of IPython\'s features.\n%quickref -> Quick reference.\nhelp      -> Python\'s own help system.\nobject?   -> Details about \'object\', use \'object??\' for extra details.\n'

# The part of the banner to be printed after the profile
# c.InteractiveShell.banner2 = ''

# Set the size of the output cache.  The default is 1000, you can change it
# permanently in your config file.  Setting it to 0 completely disables the
# caching system, and the minimum value accepted is 20 (if you provide a value
# less than 20, it is reset to 0 and a warning is issued).  This limit is
# defined because otherwise you'll spend more time re-flushing a too small cache
# than working
# c.InteractiveShell.cache_size = 1000

# Use colors for displaying information about objects. Because this information
# is passed through a pager (like 'less'), and some pagers get confused with
# color codes, this capability can be turned off.
# c.InteractiveShell.color_info = True

# Set the color scheme (NoColor, Linux, or LightBG).
# c.InteractiveShell.colors = 'Linux'

# 
# c.InteractiveShell.debug = False

# **Deprecated**
# 
# Will be removed in IPython 6.0
# 
# Enable deep (recursive) reloading by default. IPython can use the deep_reload
# module which reloads changes in modules recursively (it replaces the reload()
# function, so you don't need to change anything to use it). `deep_reload`
# forces a full reload of modules whose code may have changed, which the default
# reload() function does not.  When deep_reload is off, IPython will use the
# normal reload(), but deep_reload will still be available as dreload().
# c.InteractiveShell.deep_reload = False

# Don't call post-execute functions that have failed in the past.
# c.InteractiveShell.disable_failing_post_execute = False

# If True, anything that would be passed to the pager will be displayed as
# regular output instead.
# c.InteractiveShell.display_page = False

# 
# c.InteractiveShell.history_length = 10000

# The number of saved history entries to be loaded into the readline buffer at
# startup.
# c.InteractiveShell.history_load_length = 1000

# 
# c.InteractiveShell.ipython_dir = ''

# Start logging to the given file in append mode. Use `logfile` to specify a log
# file to **overwrite** logs to.
# c.InteractiveShell.logappend = ''

# The name of the logfile to use.
# c.InteractiveShell.logfile = ''

# Start logging to the default log file in overwrite mode. Use `logappend` to
# specify a log file to **append** logs to.
# c.InteractiveShell.logstart = False

# Save multi-line entries as one entry in readline history
# c.InteractiveShell.multiline_history = True

# 
# c.InteractiveShell.object_info_string_level = 0

# Automatically call the pdb debugger after every exception.
# c.InteractiveShell.pdb = False

# Deprecated, will be removed in IPython 5.0, use PromptManager.in_template
# c.InteractiveShell.prompt_in1 = 'In [\\#]: '

# Deprecated, will be removed in IPython 5.0, use PromptManager.in2_template
# c.InteractiveShell.prompt_in2 = '   .\\D.: '

# Deprecated, will be removed in IPython 5.0, use PromptManager.out_template
# c.InteractiveShell.prompt_out = 'Out[\\#]: '

# Deprecated, will be removed in IPython 5.0, use PromptManager.justify
# c.InteractiveShell.prompts_pad_left = True

# Output prompt. '\#' will be transformed to the prompt number
c.PromptManager.out_template = u'{color.Yellow} {color.Red}├──▶ '

# Continuation prompt.
c.PromptManager.in2_template = u'{color.Yellow} {color.Green}│.\D: '

#
c.PromptManager.color_scheme = 'Linux'

# Input prompt.  '\#' will be transformed to the prompt number
c.PromptManager.in_template = u'{color.Yellow} ' + \
                              r'{color.LightCyan}\u{color.Yellow}:'\
                               '{color.LightRed}[\Y1]\n' + \
                               u'{color.Yellow} {color.Green}├──▶ '

# If True (default), each prompt will be right-aligned with the preceding one.
c.PromptManager.justify = False

# 
# c.InteractiveShell.quiet = False

# 
# c.InteractiveShell.readline_parse_and_bind = ['tab: complete', '"\\C-l": clear-screen', 'set show-all-if-ambiguous on', '"\\C-o": tab-insert', '"\\C-r": reverse-search-history', '"\\C-s": forward-search-history', '"\\C-p": history-search-backward', '"\\C-n": history-search-forward', '"\\e[A": history-search-backward', '"\\e[B": history-search-forward', '"\\C-k": kill-line', '"\\C-u": unix-line-discard']

# 
# c.InteractiveShell.readline_remove_delims = '-/~'

# 
# c.InteractiveShell.readline_use = True

# 
# c.InteractiveShell.separate_in = '\n'

# 
# c.InteractiveShell.separate_out = ''

# 
# c.InteractiveShell.separate_out2 = ''

# Show rewritten input, e.g. for autocall.
# c.InteractiveShell.show_rewritten_input = True

# 
# c.InteractiveShell.wildcards_case_sensitive = True

# 
# c.InteractiveShell.xmode = 'Context'

#------------------------------------------------------------------------------
# TerminalInteractiveShell configuration
#------------------------------------------------------------------------------

# auto editing of files with syntax errors.
# c.TerminalInteractiveShell.autoedit_syntax = False

# Set to confirm when you try to exit IPython with an EOF (Control-D in Unix,
# Control-Z/Enter in Windows). By typing 'exit' or 'quit', you can force a
# direct exit without any confirmation.
# c.TerminalInteractiveShell.confirm_exit = True

# Set the editor used by IPython (default to $EDITOR/vi/notepad).
# c.TerminalInteractiveShell.editor = 'vi'

# The shell program to be used for paging.
# c.TerminalInteractiveShell.pager = 'less'

# Number of lines of your screen, used to control printing of very long strings.
# Strings longer than this number of lines will be sent through a pager instead
# of directly printed.  The default value for this is 0, which means IPython
# will auto-detect your screen size every time it needs to print certain
# potentially long strings (this doesn't change the behavior of the 'print'
# keyword, it's only triggered internally). If for some reason this isn't
# working well (it needs curses support), specify it yourself. Otherwise don't
# change the default.
# c.TerminalInteractiveShell.screen_length = 0

# Enable auto setting the terminal title.
# c.TerminalInteractiveShell.term_title = False

#------------------------------------------------------------------------------
# ZMQTerminalInteractiveShell configuration
#------------------------------------------------------------------------------

# A subclass of TerminalInteractiveShell that uses the 0MQ kernel

# Callable object called via 'callable' image handler with one argument, `data`,
# which is `msg["content"]["data"]` where `msg` is the message from iopub
# channel.  For exmaple, you can find base64 encoded PNG data as
# `data['image/png']`.
# c.ZMQTerminalInteractiveShell.callable_image_handler = None

# Handler for image type output.  This is useful, for example, when connecting
# to the kernel in which pylab inline backend is activated.  There are four
# handlers defined.  'PIL': Use Python Imaging Library to popup image; 'stream':
# Use an external program to show the image.  Image will be fed into the STDIN
# of the program.  You will need to configure `stream_image_handler`;
# 'tempfile': Use an external program to show the image.  Image will be saved in
# a temporally file and the program is called with the temporally file.  You
# will need to configure `tempfile_image_handler`; 'callable': You can set any
# Python callable which is called with the image data.  You will need to
# configure `callable_image_handler`.
# c.ZMQTerminalInteractiveShell.image_handler = None

# Whether to include output from clients other than this one sharing the same
# kernel.
# 
# Outputs are not displayed until enter is pressed.
# c.ZMQTerminalInteractiveShell.include_other_output = False

# Timeout (in seconds) for giving up on a kernel's is_complete response.
# 
# If the kernel does not respond at any point within this time, the kernel will
# no longer be asked if code is complete, and the console will default to the
# built-in is_complete test.
# c.ZMQTerminalInteractiveShell.kernel_is_complete_timeout = 1

# Timeout for giving up on a kernel (in seconds).
# 
# On first connect and restart, the console tests whether the kernel is running
# and responsive by sending kernel_info_requests. This sets the timeout in
# seconds for how long the kernel can take before being presumed dead.
# c.ZMQTerminalInteractiveShell.kernel_timeout = 60

# Preferred object representation MIME type in order.  First matched MIME type
# will be used.
# c.ZMQTerminalInteractiveShell.mime_preference = ['image/png', 'image/jpeg', 'image/svg+xml']

# Prefix to add to outputs coming from clients other than this one.
# 
# Only relevant if include_other_output is True.
# c.ZMQTerminalInteractiveShell.other_output_prefix = '[remote] '

# Command to invoke an image viewer program when you are using 'stream' image
# handler.  This option is a list of string where the first element is the
# command itself and reminders are the options for the command.  Raw image data
# is given as STDIN to the program.
# c.ZMQTerminalInteractiveShell.stream_image_handler = []

# Command to invoke an image viewer program when you are using 'tempfile' image
# handler.  This option is a list of string where the first element is the
# command itself and reminders are the options for the command.  You can use
# {file} and {format} in the string to represent the location of the generated
# image file and image format.
# c.ZMQTerminalInteractiveShell.tempfile_image_handler = []

# Whether to use the kernel's is_complete message handling. If False, then the
# frontend will use its own is_complete handler.
# c.ZMQTerminalInteractiveShell.use_kernel_is_complete = True

#------------------------------------------------------------------------------
# KernelManager configuration
#------------------------------------------------------------------------------

# Manages a single kernel in a subprocess on this host.
# 
# This version starts kernels with Popen.

# Should we autorestart the kernel if it dies.
# c.KernelManager.autorestart = False

# DEPRECATED: Use kernel_name instead.
# 
# The Popen Command to launch the kernel. Override this if you have a custom
# kernel. If kernel_cmd is specified in a configuration file, Jupyter does not
# pass any arguments to the kernel, because it cannot make any assumptions about
# the arguments that the kernel understands. In particular, this means that the
# kernel does not receive the option --debug if it given on the Jupyter command
# line.
# c.KernelManager.kernel_cmd = []

#------------------------------------------------------------------------------
# Session configuration
#------------------------------------------------------------------------------

# Object for handling serialization and sending of messages.
# 
# The Session object handles building messages and sending them with ZMQ sockets
# or ZMQStream objects.  Objects can communicate with each other over the
# network via Session objects, and only need to work with the dict-based IPython
# message spec. The Session will handle serialization/deserialization, security,
# and metadata.
# 
# Sessions support configurable serialization via packer/unpacker traits, and
# signing with HMAC digests via the key/keyfile traits.
# 
# Parameters ----------
# 
# debug : bool
#     whether to trigger extra debugging statements
# packer/unpacker : str : 'json', 'pickle' or import_string
#     importstrings for methods to serialize message parts.  If just
#     'json' or 'pickle', predefined JSON and pickle packers will be used.
#     Otherwise, the entire importstring must be used.
# 
#     The functions must accept at least valid JSON input, and output *bytes*.
# 
#     For example, to use msgpack:
#     packer = 'msgpack.packb', unpacker='msgpack.unpackb'
# pack/unpack : callables
#     You can also set the pack/unpack callables for serialization directly.
# session : bytes
#     the ID of this Session object.  The default is to generate a new UUID.
# username : unicode
#     username added to message headers.  The default is to ask the OS.
# key : bytes
#     The key used to initialize an HMAC signature.  If unset, messages
#     will not be signed or checked.
# keyfile : filepath
#     The file containing a key.  If this is set, `key` will be initialized
#     to the contents of the file.

# Threshold (in bytes) beyond which an object's buffer should be extracted to
# avoid pickling.
# c.Session.buffer_threshold = 1024

# Threshold (in bytes) beyond which a buffer should be sent without copying.
# c.Session.copy_threshold = 65536

# Debug output in the Session
# c.Session.debug = False

# The maximum number of digests to remember.
# 
# The digest history will be culled when it exceeds this value.
# c.Session.digest_history_size = 65536

# The maximum number of items for a container to be introspected for custom
# serialization. Containers larger than this are pickled outright.
# c.Session.item_threshold = 64

# execution key, for signing messages.
# c.Session.key = ''

# path to file containing execution key.
# c.Session.keyfile = ''

# Metadata dictionary, which serves as the default top-level metadata dict for
# each message.
# c.Session.metadata = {}

# The name of the packer for serializing messages. Should be one of 'json',
# 'pickle', or an import name for a custom callable serializer.
# c.Session.packer = 'json'

# The UUID identifying this session.
# c.Session.session = u''

# The digest scheme used to construct the message signatures. Must have the form
# 'hmac-HASH'.
# c.Session.signature_scheme = 'hmac-sha256'

# The name of the unpacker for unserializing messages. Only used with custom
# functions for `packer`.
# c.Session.unpacker = 'json'

# Username for the Session. Default is your system username.
# c.Session.username = u'miltos'
