#!/bin/bash
IFS=$'\n'

i3status -c /home/suzuki/.i3/i3status.conf | while :
do 
    read line
    
    C0="C0: `sensors | grep \"Core 0:\" | perl -ne 'if ($_ =~ m/(\+.*)(.*)/) {print \"$1\n\";}' | cut -d\" \" -f1`"
    C2="C1: `sensors | grep \"Core 2:\" | perl -ne 'if ($_ =~ m/(\+.*)(.*)/) {print \"$1\n\";}' | cut -d\" \" -f1`"

    ARTIST=`mocp -i | grep Artist | cut -d " " -f 2-`
    SONGTITLE=`mocp -i | grep SongTitle | cut -d " " -f 2-`
    CURRENTTIME=`mocp -i | grep CurrentTime | cut -d " " -f 2-`
    TOTALTIME=`mocp -i | grep TotalTime | cut -d " " -f 2-`

    echo "$ARTIST - $SONGTITLE ($CURRENTTIME - $TOTALTIME) | $C0 | $C2 | $line"
done
