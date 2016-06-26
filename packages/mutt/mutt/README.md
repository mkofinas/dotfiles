# Mutt Configuration

### User Configuration

The configuration provided will work for any (Gmail) account. However, you need
to set up your credentials first. Specifically, the following variables need to
be set up:

```
set imap_user = "[username]@gmail.com"
set imap_pass = "[password]"
set smtp_url = "smtp://[username]@smtp.gmail.com:587/"
set smtp_pass = "[password]"
set from = "[username]@gmail.com"
set realname = "[My-Real-Name]"
set folder = "imaps://[username]@imap.gmail.com/"
```

Change the placeholders enclosed in brackets (i.e. [username], [password] and
[My-Real-Name]) with the appropriate values.

### XDG Compliance

If you want to use the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/)
to organize your files, you can add the following command in your `zshrc` (or
the corresponding shell configuration file):

```sh
alias mutt="sudo mutt -F ${XDG_CONFIG_HOME:-${HOME}/.config}/mutt/muttrc"
```

Additionally, place the following commands in your `muttrc`:

```
set header_cache = "${HOME}/.cache/mutt/headers"
set message_cachedir = "${HOME}/.local/share/mutt/messages"
```

### Protect Mail Directories

In order to add an extra layer of protection to your mail data, you can restrict
permissions to mutt directories, using the following commands:

```sh
mkdir -p "${XDG_CACHE_HOME:-${HOME}/.cache}/mutt/headers"
mkdir -p "${XDG_DATA_HOME:-${HOME}/.local/share}/mutt/messages"
chmod 700 "${XDG_CACHE_HOME:-${HOME}/.cache}/mutt"
chmod 700 "${XDG_DATA_HOME:-${HOME}/.local/share}/mutt"
```

If you use the installation script provided with this repository, the above
commands are automatically taken care for you.

### Resources:

- https://wiki.archlinux.org/index.php/mutt
- http://blog.developwithpassion.com/2013/05/02/getting-up-and-running-with-a-sane-mutt-setup/
- http://www.techrepublic.com/blog/linux-and-open-source/easy-gmail-reading-with-mutt/
- https://dev.mutt.org/trac/wiki/MuttGuide
- Mutt Man Pages (mutt(1) & muttrc(5))
