#!/bin/sh
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ -d "$filesdir" ]; then
    echo "Directory $filesdir exist"
else
    echo "Directory $filesdir does not exist"
    exit 1
fi

filesCount=$(find -L $filesdir -type f | wc -l)
c=$(grep -rw $searchstr $filesdir -R | wc -l)
echo "The number of files are $filesCount and the number of matching lines are $c"