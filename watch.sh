#!/bin/bash
cd `dirname $0`

if [ ! -d "../incoming" ]; then
    echo "Directory ../incoming does not exist."
    exit 1
fi
cp */*.zip ../incoming/

for FILE in $(ls */*.watch.py); do
    header=$(head -n 1 $FILE)
    #if [[ $header == "#os=$(uname)" ]] || [[ $header != \#os=* ]]; then
    if [[ $header == "#os=$(uname)" ]]; then
        echo $FILE
        0install run --version-for=http://0install.net/2007/interfaces/ZeroInstall.xml 2.3.12.. https://apps.0install.net/0install/0watch.xml --output ../incoming $FILE
    fi
done
