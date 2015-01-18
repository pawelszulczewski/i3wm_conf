#!/bin/bash
IFS=$'\n'
FILE=http://www.if.pw.edu.pl/~meteo/index.php

i3status -c /home/suzuki/.i3/i3status.conf | while :
do 
    read line
     for i in `curl -s $FILE | grep 'ff7777'`
     do    
	TEMP=`echo $i | perl -ne 'if ($_ =~ m/\&nbsp;(.*?)&nbsp;/) {print "$1"};'`
	TEMP_VAL=`echo $TEMP | iconv -f iso-8859-2 -t utf-8`
	C0="C0: `sensors | grep \"Core 0:\" | perl -ne 'if ($_ =~ m/(\+.*)(.*)/) {print \"$1\n\";}' | cut -d\" \" -f1`"
	C2="C1: `sensors | grep \"Core 2:\" | perl -ne 'if ($_ =~ m/(\+.*)(.*)/) {print \"$1\n\";}' | cut -d\" \" -f1`"
	DATA=`date "+%a, %F, %H:%M"`
	echo "$line | $TEMP_VAL | $C0 | $C2 | $DATA"
	#echo "$line | $TEMP_VAL | $C0 | $C2 | $DATA"
    done
done

