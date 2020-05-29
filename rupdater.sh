# @(#) $Id: rupdater.sh,v 1.13 2020/05/29 13:48:17 ralph Exp $
# --=-----------------------------------------------------------------------=---
# (c) 1997 - 2020 by Ralph Roth  -*- http://rose.rult.at -*-
# This script is maintained at: https://github.com/roseswe/rupdater

# There is no integrated update mechanism for our programs. You can use the
# shell script rupdater.sh if you have a *NIX environment to download updates
# of the program.

echo "ROSE SWE automatic updater for Linux or Win32/cygwin using wget/awk"

URL=http://rose-swe.bplaced.net/dl
#   -N,  --timestamping            don't re-retrieve files unless newer than
wget -qN $URL/md5sums.md5 2>&1 > /dev/null || exit 1

dos2unix md5sums.md5   > /dev/null    ## in the case we had used the win32 version of dir2html?

for i in rhbvs F_Mirc favboot AntiLink rfwt_ VirScanPlus MemScan CrCheck HackStop hashall
do
     FILE=$(gawk ' $2 ~ /'${i}'/  { print $2; }; ' md5sums.md5)
     # echo "$i=$FILE" # debug
     if [ ! -r "$FILE" ]
     then
        echo "Trying to download new/updated file $FILE (from the $i package)"
        wget -qN -c $URL/$FILE
     else
        echo "SORRY: $FILE: No newer version available!"
     fi
done

md5sum --quiet -c md5sums.md5  # prints only corrupted files
rc=$?

exit $rc

# $Header: /home/cvs/src/prj/web_page/rupdater.sh,v 1.13 2020/05/29 13:48:17 ralph Exp $
# ------------------------------------------------------------------------
# atom:set fenc=utf8 ff=unix ft=shell ts=2 et:
