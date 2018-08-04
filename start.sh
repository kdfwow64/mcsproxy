#!/bin/sh

DIR='/usr/share/mcproxy/'

#${DIR}sproxy &
echo "* * * * *	${DIR}sproxy.sh >/dev/null 2>&1" > ${DIR}/cron
crontab -i ${DIR}/cron
