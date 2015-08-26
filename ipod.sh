#!/bin/sh

n=65536

for f in `find /home/cmd/.priv/vid/unknown -type f -name '*.mpg'`; do
		fname=`basename $f`
		name=`echo $fname | cut -d. -f 1`
		name=/home/cmd/.priv/aw/vid/${name}.mp4
		ff="ffmpeg -y -vcodec mpeg4 -b 300 -qmin 3 -qmax 5 -bufsize $n -g 300 -acodec aac -ab 96 -s 320x240 -aspect 4:3 -i $f $name"
		$ff
done

