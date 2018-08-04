#!/bin/sh

NAME="sproxy"

cat /var/spool/cron/crontabs/root | grep -v ${NAME} > /tmp/renamecron
P=`pgrep -f "/bin/sh -c /usr/share/mcproxy/sproxy.sh >/dev/null 2>&1"`
P1=`pgrep -f "/usr/share/mcproxy/sproxy.sh"`
kill -KILL ${P} > /dev/null 2>&1
kill -KILL ${P1} > /dev/null 2>&1
killall -KILL ${NAME} > /dev/null 2>&1

mv /tmp/renamecron /var/spool/cron/crontabs/root
