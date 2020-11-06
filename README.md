
# youtube-ad-domains-pihole

##### How to generate list on your own machine:
###### Requires:
- Sublist3r
- pihole
- run as root

(optional) Change paths in bash script.
Import adlist in Group Management Page, and because the script adds the file to your pihole's webserver you can add the list at this url: `http://pi.hole/youtube-ad-domains.txt`

Then add the following to your crontab (change pathing if you must):
~~~
0 */12 * * * /opt/youtube-ad-domains-pihole/generate-domains.sh >/dev/null 2>&1
~~~

##### Or you can import it:
I commit the adlist I generate on my own daily to this repo.

You can import it into your pihole through the Group Management Menu page on the web interface. And add this url `https://raw.githubusercontent.com/bilkoh/youtube-ad-domains-pihole/main/youtube-ad-domains.txt` as a new adlist.
