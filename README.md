# rupdater.sh (ROSE SWE Updater)

**rupdater.sh** is a lightweight shell script designed to download files from the ROSE SWE download page and verify their MD5 hashes. This tool is specifically tailored for *NIX-like operating systems. However, due to its limitations, it has been succeeded by **rupdater2**, a more versatile command-line tool that supports multiple platforms. Therefore, the usage of `rupdater.sh` is discouraged, and this GitHub repository may be archived in the future.

## Overview

Currently, there is no integrated automated update mechanism for the programs from **rose_swe**. To address this, we provide the `rupdater.sh` shell script to facilitate updates from the following sites:

- [rose.rult.at](http://rose.rult.at/)
- [cfg2html.com](http://www.cfg2html.com)

Given the limitations of this shell script, we also offer a pre-built binary as part of the follow-up project, [rUpdater2](https://github.com/roseswe/rupdater2), which supports Windows and MacOS environments!

## Usage

### Requirements

The `rupdater.sh` script is designed for use in a *NIX environment. It utilizes standard POSIX commands such as `md5sum`, `wget`, `(g)awk`, `dos2unix`, `timeout`, and others. The program has been tested on various Linux distributions, including openSUSE, Ubuntu, SLES, and Debian, as well as on Cygwin (32/64) for Windows and WSL2.

**Note:** `rupdater.sh` was tested with Ubuntu 22.04 on WSL2 and works out of the box!

**Important:** Please be aware that `timeout` and `dos2unix` may not be installed by default on some distributions. You might need to install these utilities manually.

### How to Use

To download updates for the programs from [rose.rult.at](http://rose.rult.at), simply run the `rupdater.sh` script. Ensure your environment meets the requirements and that the necessary commands are available.

## Source Code

The source code for `rupdater.sh` is available on GitHub: [https://github.com/roseswe/rupdater](https://github.com/roseswe/rupdater)

## Versioning

Version numbering and release tags follow the CVS tag convention.

## Known Issues and TODO

- **MD5 Check:** Currently, no MD5 check is performed before downloading a file; it is only conducted afterward. Consequently, if the filename remains the same, the file will not be updated or downloaded. This is an area marked for improvement in future versions.

By using **rupdater.sh**, you can streamline the process of keeping your **rose_swe** programs up-to-date in a *NIX environment. For any issues or contributions, please refer to the source code repository.

<!--
vim:set fileencoding=utf8 fileformat=unix filetype=gfm tabstop=2 expandtab:
$Id: README.md,v 1.13 2025/05/30 08:55:57 ralph Exp $
-->
