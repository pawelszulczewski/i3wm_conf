#!/bin/bash
IFS=$'\n'

i3status -c /home/suzuki/.i3/i3status.conf | while :
do 
    read line
    
    C0="C0: `sensors | grep \"Core 0:\" | perl -ne 'if ($_ =~ m/(\+.*)(.*)/) {print \"$1\n\";}' | cut -d\" \" -f1`"
    C2="C1: `sensors | grep \"Core 2:\" | perl -ne 'if ($_ =~ m/(\+.*)(.*)/) {print \"$1\n\";}' | cut -d\" \" -f1`"

    MOCP=`mocp -Q "%artist - %song (%ct - %tt)"`
    echo "$MOCP | $C0 | $C2 | $line"
done
