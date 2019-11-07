#!/usr/bin/env bash
IFS="
"
for FILE in $(git ls-files)
do
    TIME=$(git log --pretty=format:%cd -n 1 --date=iso -- "$FILE")
    # echo $TIME $FILE
    TIME1=$(echo ${TIME//[-:+]/ } | awk -F ' ' '{print $1$2$3$4$5"."$6}')
    echo $TIME1 $FILE 
done