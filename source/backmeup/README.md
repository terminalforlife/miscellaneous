# Introduction

Utility written in _Bourne Shell_ to allow the user to easily back up their _HOME_ to a pre-defined storage location, using a _GZip_-compressed archive generated with _tar_(1).

Optionally, the user can have _notify-send_(1) send a notification to his or her notifications daemon and/or a shell command executed, when the backup routine is finished.

Per _tar_(1)'s regular functionality, you can also provide an exclusion file, in which the user can list files he or she wishes not to be backed up.

# Installation Instructions

Installation can be done with [Cito](https://github.com/terminalforlife/Extra/blob/master/source/cito). Your best bet, however, is to install via BackMeUp's [installation script](https://github.com/terminalforlife/Extra/blob/master/source/backmeup/backmeup-installer).

For a quick terminal one-liner, using the aforementioned installation script, you should be able to execute the following, assuming you have sudo(8):

```sh
(cd /tmp; curl -so backmeup-installer 'https://raw.githubusercontent.com/terminalforlife/Extra/master/source/backmeup/backmeup-installer' && sudo \sh backmeup-installer; rm backmeup-installer)
```

If that fails, you probably don't have curl(1), so try wget(1):

```sh
(cd /tmp; wget -qO backmeup-installer 'https://raw.githubusercontent.com/terminalforlife/Extra/master/source/backmeup/backmeup-installer' && sudo \sh backmeup-installer; rm backmeup-installer)
```

If you don't have sudo(8), just omit it from the command(s) above, and run them as the `root` user, however you gain such privileges.

# Removing BackMeUp

If you've used the installer, then you can run the following to delete the files it creates:

```
sudo rm -v /usr/share/man/man1/backmeup.1.gz /usr/share/bash-completion/completions/backmeup /usr/bin/backmeup
```

If you don't have sudo(8), you'll have to acquire root privileges by other means.
