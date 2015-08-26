 n=$(($n+1)); t="Cavern"; flac -c -d ph1994-07-08d3t07.flac | lame --preset standard --ty 1994 --ta Phish --tl "1994-07-08" --tt "$t" --tg "Rock" --tn $n - "$t.mp3"
