#!/bin/bash

DIR='/usr/share/mcproxy/'

cd ${DIR}

periodic=3
count=1


let "max = 60 / $periodic"
export PATH="${PATH}:/usr/bin:/bin:/usr/local/bin:/sbin:/usr/sbin"
function start_proxy {
    ANSVER=`netstat -ntulp | grep 8082`


    if [ -z "${ANSVER}" ]
    then
        ${DIR}sproxy 2> /dev/null &
        echo "proxy start"

    else
        echo 'mcproxy is on'
    fi
}

while [ $count -le $max ]
do
start_proxy
sleep $periodic
count=$(( $count + 1 ))
done