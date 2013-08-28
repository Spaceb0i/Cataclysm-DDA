#!/bin/bash

oldpwd=`pwd`

if [ ! -d lang/po ]
then
    if [ -d ../lang/po ]
    then
        cd ..
    else
        echo "Error: Could not find lang/po subdirectory."
        exit 1
    fi
fi

# merge lang/po/cataclysm-dda.pot with .po file for each specified language
if [ $# -gt 0 ]
then
    for n in $@
    do
        msgmerge -F -U lang/po/${n}.po lang/po/cataclysm-dda.pot
    done
else
# otherwise merge lang/po/cataclysm-dda.pot with all .po files in lang/po
    for f in lang/po/*.po
    do
        echo $f
        msgmerge -F -U $f lang/po/cataclysm-dda.pot
    done
fi

cd $oldpwd

