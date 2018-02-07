# @(#) $Id: rupdater.sh,v 1.11 2018/02/07 19:01:31 ralph Exp $
# --=-----------------------------------------------------------------------=---
# (c) 1997 - 2018 by Ralph Roth  -*- http://rose.rult.at -*-
# This script is maintained at: https://github.com/roseswe/rupdater

# There is no integrated update mechanism for our programs. You can use the
# shell script rupdater.sh if you have a *NIX environment to download updates
# of the program.

echo "ROSE SWE automatic updater for Linux or Win32/cygwin using wget/awk"

URL=http://rose-swe.bplaced.net/dl
#   -N,  --timestamping            don't re-retrieve files unless newer than
wget -N $URL/md5sums.md5  || exit 1

for i in rhbvs fmirc f_mirc md5test VirScanPlus MemScan CrCheck HackStop hashall
do
     FILE=$(gawk ' $2 ~ /'${i}'/  { print $2; }; ' md5sums.md5)
     # echo "$i=$FILE" # debug
     if [ ! -r "$FILE" ]
     then
        echo "Trying to download new/updated file $FILE (from the $i package)"
        wget -N -c $URL/$FILE
     else
        echo "SORRY: $FILE: No newer version available!"
     fi
done

# $Header: /home/cvs/src/prj/web_page/rupdater.sh,v 1.11 2018/02/07 19:01:31 ralph Exp $
# ------------------------------------------------------------------------
# atom:set fenc=utf8 ff=unix ft=shell ts=2 et:
