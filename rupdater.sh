# @(#) $Id: rupdater.sh,v 1.17 2022/02/11 12:49:57 ralph Exp $
# --=-----------------------------------------------------------------------=---
# (c) 1997-2022 by Ralph Roth  -*- http://rose.rult.at -*-
# This script is maintained at: https://github.com/roseswe/rupdater

# There is no integrated update mechanism for our programs. You can use the
# shell script rupdater.sh if you have a *NIX environment to download updates
# of the program.

echo "ROSE SWE automatic updater for Linux or Win32/cygwin using wget/awk"

URL=http://rose-swe.bplaced.net/dl
#   -N,  --timestamping            don't re-retrieve files unless newer than
wget -qN ${URL}/md5sums.md5 2>&1 > /dev/null || exit 1

dos2unix md5sums.md5   2> /dev/null    ## in the case we had used the win32 version of dir2html?

## 2022: removed: f_mirc, CrCheck, HackStop

## Main/interesting programs:
for i in rhbvs rms favboot AntiLink rfwt_ VirScanPlus MemScan  hashall MPScan dir2html rADFAQ rPCP rUPP rupdater.sh
do
     FILE=$(gawk ' $2 ~ /'${i}'/  { print $2; }; ' md5sums.md5|tail -1)
     # echo "$i=$FILE" # debug
     if [ ! -r "${FILE}" ]
     then
        echo "[!!] ${FILE}: Trying to download new/updated file"
        timeout 15m  wget -qN -c ${URL}/${FILE}
     else
        echo "[OK] ${FILE}: No newer version available!"
     fi
done
echo ""
echo "Downloading finished, checking the downloaded files with MD5SUM..."
md5sum --quiet -c md5sums.md5  # prints only corrupted files
rc=$?

exit $rc

# $Header: /home/cvs/src/prj/web_page/rupdater.sh,v 1.17 2022/02/11 12:49:57 ralph Exp $
# ------------------------------------------------------------------------
# vim:set fenc=utf8 ff=unix ft=shell ts=2 et:
