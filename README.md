**MASTER** - _Hopefully stable branch._\
**DEV** - _Development Branch (latest changes)_

# Introduction to Extra

Thank you for your interest. Despite the non-descript name of this repository, it's actually full of a _lot_ of presentable, carefully-written shell programs.

Some of the programs within this repository were written and are maintained for a Bourne POSIX-compliant shell (with [Yash](https://yash.osdn.jp/) as guidance), and others are written for the Bourne Again Shell.

As of 2021-01-26, here are some highlights:

  * [autoexec](source/autoexec) - Development tool for automatic execution of files
  * [backmeup](source/backmeup) - Simple and portable solution to HOME backup
  * [cito](source/cito) - Portable installer for local or GitHub files
  * [fetcher](source/fetcher) - Simple interactive multi-file downloader for the terminal.
  * [glkfu](source/glkfu) - Easily compile & build Debian packages for Linux kernels
  * [libtflbp-sh](source/libtflbp-sh) - Function library for Bourne Shell programs.
  * [lspkg](source/lspkg) - Search through, test for, and list out installed packages
  * [rmne](source/rmne) - Remove all of the non-essential Debian packages
  * [simplify-ubuntu](source/simplify-ubuntu) - De-bloat Ubuntu by interactively removing unneeded packages.

Continue to the next section to see how you can get them...

# Instructions for Installation

Some of the following commands tell you to use [sudo](https://en.wikipedia.org/wiki/Sudo), but not everybody _has_ that utility; if you're such a person, then you'll likely want to use [su](https://en.wikipedia.org/wiki/Su_\(Unix\)) prior to running the commands otherwise ran with sudo.

You have various options available to you:

  * You can install one of the many Debian packages I've built and stored within the [DEB-Packages](https://github.com/terminalforlife/DEB-Packages) repository. This won't always be the latest version, but it's the easiest method, provided you're on an Ubuntu- or Debian-based installation of Linux.

  * You can install [Cito](https://github.com/terminalforlife/Extra/blob/master/source/cito/cito). It's lightweight and portable, installable with the following one-liner, after which many programs or files on GitHub or locally are quick, robust, and painless to install -- not just my own!

    ```bash
    wget -q 'https://raw.githubusercontent.com/terminalforlife/Extra/master/source/cito/cito'; sudo sh cito cito
    ```

  * If you're on a Debian- or Ubuntu-based distribution of Linux, refer to the [DEB-Packages](https://github.com/terminalforlife/DEB-Packages) repository for a list of Debian packages for various versions of TFL programs which you can install.
