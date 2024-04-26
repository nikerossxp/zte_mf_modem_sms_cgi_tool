#!/bin/bash
#
#Tested on unlocked MF823 with r04 custom firmware

ip="192.168.0.1"
tz="UTC-3"
curdatetime=`TZ=":$tz" date +'%y%m%d%H%M%S'`

curl -d "cmd=sms_data_total&page=0&data_per_page=5000&mem_store=1&tags=10&order_by=order+by+id+desc" -H "X-Requested-With:XMLHttpRequest" -H "Referer:http://$ip/index.html" -X POST "http://$ip/goform/goform_get_cmd_process" --compressed --silent | json_pp >> msgs$curdatetime

ids=`cat msgs$curdatetime | grep '"id"'`

echo "$ids" | grep -Eo '[0-9]{1,4}' > msgids

rm msgs$curdatetime

while IFS="" read -r id || [ -n "$id" ]
do
  curl -d "isTest=false&goformId=DELETE_SMS&msg_id=$id&notCallback=true" -H "X-Requested-With:XMLHttpRequest" -H "Referer:http://$ip/index.html" -X POST "http://$ip/goform/goform_set_cmd_process" --compressed --silent --output /dev/null
done < msgids

rm msgids
