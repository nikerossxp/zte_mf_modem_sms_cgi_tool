#!/bin/bash
#
#Tested on unlocked MF823 with r04 custom firmware
#Usage: send_sms.sh +791234567890 'test тест'
#Cyrillic and symbols like ,./\;:[]()|~-=+- works.
#Modem disconnects internet, send sms and reconnects.

ip="192.168.0.1"
phone=`printf %s $1 |jq -sRr @uri`
tz="UTC-3"
datetime=`TZ=":$tz" date +'%y;%m;%d;%H;%M;%S;'`
msg=$(printf "$2" | iconv -f UTF-8 -t UCS-2BE | xxd -p | tr -d '\n')

curl -d "isTest=false&goformId=SEND_SMS&notCallback=true&Number=$phone&sms_time=$datetime&MessageBody=$msg&ID=-1&encode_type=UNICODE" -H "X-Requested-With:XMLHttpRequest" -H "Referer:http://$ip/index.html" -X POST "http://$ip/goform/goform_set_cmd_process" --compressed --silent --output /dev/null
