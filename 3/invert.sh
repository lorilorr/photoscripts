#!/bin/sh
echo "usage invert.sh file_in fps"
rm 00*.jpeg audio.mp2 audio2.mp2 flist.txt
ffmpeg -i "$1" %08d.jpeg audio.mp2
find . -name "0*.jpeg" > flist.txt
inv_fns flist.txt
rm flist.txt
sox audio.mp2 audio2.mp2 reverse
rm audio.mp2
ffmpeg -r $2 -b 2000k -i %08d.jpeg -i audio2.mp2 "inv_$1"
rm 00*.jpeg audio2.mp2
for f in 00*.jpeg; do rm -f $f; done

