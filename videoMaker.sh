#!/bin/bash
cd bigimages/conus
mkdir videoPNGS
cd videoPNGS
rm -rf *
a=1
for i in ../*.png; do
  new=$(printf "%04d.png" "$a") #04 pad to length of 4
  cp -i -- "$i" "$new"
  let a=a+1
done
ffmpeg -r 24 -f image2   -i %04d.png -vcodec libx264 -crf 25 -aspect 16:9 -vf "scale=1280:trunc(ih/2)*2"  -pix_fmt yuv420p output.mp4
# ffmpeg -framerate 24 -i %04d.png output.mp4