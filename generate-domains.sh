#!/usr/bin/bash 
# Generates a list of youtube ad domains using sublist3r to block in pihole.
# This is meant to be run by crontab.
# -------------------------------------------------------------------------------------
# Blocking ads on YouTube is hit or miss with Pi-hole. The reason for this is 
# because ads are typically served from the same domain as the video is.

# Many users see unique domains in the logs such as 
# r4---sn-vgqs7nez.googlevideo.com and have had some success in blocking these,
# but there are so many and it's different for different people, so it's not foolproof.
# -------------------------------------------------------------------------------------

SUBLIST3R=/opt/Sublist3r/sublist3r.py

# PATH where http://pi.hole is hosted
PIHOLE_WWW_PATH=/var/www/html

# pwd of current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

$SUBLIST3R -d googlevideo.com -n -o /tmp/domains.txt
cat /tmp/domains.txt >> $DIR/youtube-ad-domains.txt
echo "$(grep  '^r' $DIR/youtube-ad-domains.txt | grep -v '^redirector' | sort | uniq)" > $DIR/youtube-ad-domains.txt
cp $DIR/youtube-ad-domains.txt $PIHOLE_WWW_PATH/youtube-ad-domains.txt

pihole -g
pihole restartdns
