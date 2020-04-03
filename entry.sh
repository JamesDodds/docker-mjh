#!/bin/sh

# grab data at start
/bin/bash /usr/epggrab/grab.sh
# start cron
/usr/sbin/crond -f -l 8