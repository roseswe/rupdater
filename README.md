# rupdater (ROSE SWE Updater)

## Overview

Currently, there is no integrated automated update mechanism for the programs from **rose_swe**. To address this, we provide a shell script, `rupdater`, to facilitate updates from the following sites:

- [rose.rult.at](http://rose.rult.at/)
- [cfg2html.com](http://www.cfg2html.com)

## Usage

### Requirements

The `rupdater.sh` script is designed for use in a *NIX environment. It utilizes standard POSIX commands such as `md5sum`, `wget`, `(g)awk`, `dos2unix`, `timeout`, and others. The program was tested on various Linux distributions (openSUSE, Ubuntu, SLES and Debian) as well as on cygwin 32/64 for Windows and WSL2.

NOTE: rupdater was tested with Ubuntu 22.04 on WSL2 which works out of the box!

**Important:** Please note that `timeout` and `dos2unix` are not installed by default on some distributions. You may need to install these utilities manually.

### How to Use

To download updates for the programs from [rose.rult.at](http://rose.rult.at), you can use the `rupdater.sh` script. Ensure your environment meets the requirements and that the necessary commands are available.

## Source Code

The source code for `rupdater` is available on GitHub: [https://github.com/roseswe/rupdater](https://github.com/roseswe/rupdater)

## Versioning

Version numbering and release tags follow the CVS tag convention.

## Known Issues and TODO

- **MD5 Check:** Currently, no MD5 check is performed before downloading a file; it is only conducted afterward. Consequently, if the filename remains the same, the file will not be updated or downloaded. This is an area marked for improvement in future versions.

By using `rupdater`, you can streamline the process of keeping your **rose_swe** programs up-to-date in a *NIX environment. For any issues or contributions, please refer to the source code repository.

<!--
vim:set fileencoding=utf8 fileformat=unix filetype=gfm tabstop=2 expandtab:
$Id: README.md,v 1.10 2024/09/15 10:24:59 ralph Exp $
-->
