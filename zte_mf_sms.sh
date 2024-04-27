#!/bin/bash

# -h shows help

ip="192.168.0.1"
tz="UTC-3"
curdatetime=`TZ=":$tz" date +'%y%m%d%H%M%S'`

All()
{
echo "ALL"
curl -d "cmd=sms_data_total&page=0&data_per_page=5000&mem_store=1&tags=10&order_by=order+by+id+desc" -H "X-Requested-With:XMLHttpRequest" -H "Referer:http://$ip/index.html" -X POST "http://$ip/goform/goform_get_cmd_process" --compressed --silent | json_pp >> inmsgs$curdatetime

sed -i '/sms_mem/d' inmsgs$curdatetime
sed -i '/concat_sms_received/d' inmsgs$curdatetime
sed -i '/concat_sms_total/d' inmsgs$curdatetime
sed -i '/draft_group_id/d' inmsgs$curdatetime
#sed -i '/id/d' inmsgs$curdatetime
sed -i '/received_all_concat_sms/d' inmsgs$curdatetime
sed -i '/sms_class/d' inmsgs$curdatetime
sed -i '/sms_submit_msg_ref/d' inmsgs$curdatetime

cat inmsgs$curdatetime  |  grep -oP '(?<="content" : ").*(?=",)' > cntn$curdatetime
date=`cat inmsgs$curdatetime  |  grep -oP '(?<="date" : ").*(?=",)'`

while IFS="" read -r msg || [ -n "$msg" ]
do
	coded=$(echo -n $msg | sed "s/\(.\{2\}\)/\\\x\1/g")
	decoded=$(printf $coded | iconv -f UCS-2BE -t UTF-8)
	sed -i "s/$msg/$decoded/g" inmsgs$curdatetime
done < cntn$curdatetime

cat inmsgs$curdatetime | json_pp

rm cntn$curdatetime
rm inmsgs$curdatetime
}

Unread()
{
echo "UNREAD"
curl -d "cmd=sms_data_total&page=0&data_per_page=5000&mem_store=1&tags=1&order_by=order+by+id+desc" -H "X-Requested-With:XMLHttpRequest" -H "Referer:http://$ip/index.html" -X POST "http://$ip/goform/goform_get_cmd_process" --compressed --silent | json_pp >> inmsgs$curdatetime

sed -i '/sms_mem/d' inmsgs$curdatetime
sed -i '/concat_sms_received/d' inmsgs$curdatetime
sed -i '/concat_sms_total/d' inmsgs$curdatetime
sed -i '/draft_group_id/d' inmsgs$curdatetime
#sed -i '/id/d' inmsgs$curdatetime
sed -i '/received_all_concat_sms/d' inmsgs$curdatetime
sed -i '/sms_class/d' inmsgs$curdatetime
sed -i '/sms_submit_msg_ref/d' inmsgs$curdatetime

cat inmsgs$curdatetime  |  grep -oP '(?<="content" : ").*(?=",)' > cntn$curdatetime
date=`cat inmsgs$curdatetime  |  grep -oP '(?<="date" : ").*(?=",)'`

while IFS="" read -r msg || [ -n "$msg" ]
do
	coded=$(echo -n $msg | sed "s/\(.\{2\}\)/\\\x\1/g")
	decoded=$(printf $coded | iconv -f UCS-2BE -t UTF-8)
	sed -i "s/$msg/$decoded/g" inmsgs$curdatetime
done < cntn$curdatetime

cat inmsgs$curdatetime | json_pp

rm cntn$curdatetime
rm inmsgs$curdatetime
}

Read()
{
echo "READ"
curl -d "cmd=sms_data_total&page=0&data_per_page=5000&mem_store=1&tags=0&order_by=order+by+id+desc" -H "X-Requested-With:XMLHttpRequest" -H "Referer:http://$ip/index.html" -X POST "http://$ip/goform/goform_get_cmd_process" --compressed --silent | json_pp >> inmsgs$curdatetime

sed -i '/sms_mem/d' inmsgs$curdatetime
sed -i '/concat_sms_received/d' inmsgs$curdatetime
sed -i '/concat_sms_total/d' inmsgs$curdatetime
sed -i '/draft_group_id/d' inmsgs$curdatetime
#sed -i '/id/d' inmsgs$curdatetime
sed -i '/received_all_concat_sms/d' inmsgs$curdatetime
sed -i '/sms_class/d' inmsgs$curdatetime
sed -i '/sms_submit_msg_ref/d' inmsgs$curdatetime

cat inmsgs$curdatetime  |  grep -oP '(?<="content" : ").*(?=",)' > cntn$curdatetime
date=`cat inmsgs$curdatetime  |  grep -oP '(?<="date" : ").*(?=",)'`

while IFS="" read -r msg || [ -n "$msg" ]
do
	coded=$(echo -n $msg | sed "s/\(.\{2\}\)/\\\x\1/g")
	decoded=$(printf $coded | iconv -f UCS-2BE -t UTF-8)
	sed -i "s/$msg/$decoded/g" inmsgs$curdatetime
done < cntn$curdatetime

cat inmsgs$curdatetime | json_pp

rm cntn$curdatetime
rm inmsgs$curdatetime
}

Sent()
{
echo "SENT"
curl -d "cmd=sms_data_total&page=0&data_per_page=5000&mem_store=1&tags=2&order_by=order+by+id+desc" -H "X-Requested-With:XMLHttpRequest" -H "Referer:http://$ip/index.html" -X POST "http://$ip/goform/goform_get_cmd_process" --compressed --silent | json_pp >> inmsgs$curdatetime

sed -i '/sms_mem/d' inmsgs$curdatetime
sed -i '/concat_sms_received/d' inmsgs$curdatetime
sed -i '/concat_sms_total/d' inmsgs$curdatetime
sed -i '/draft_group_id/d' inmsgs$curdatetime
#sed -i '/id/d' inmsgs$curdatetime
sed -i '/received_all_concat_sms/d' inmsgs$curdatetime
sed -i '/sms_class/d' inmsgs$curdatetime
sed -i '/sms_submit_msg_ref/d' inmsgs$curdatetime

cat inmsgs$curdatetime  |  grep -oP '(?<="content" : ").*(?=",)' > cntn$curdatetime
date=`cat inmsgs$curdatetime  |  grep -oP '(?<="date" : ").*(?=",)'`
echo $date

while IFS="" read -r msg || [ -n "$msg" ]
do
	coded=$(echo -n $msg | sed "s/\(.\{2\}\)/\\\x\1/g")
	decoded=$(printf $coded | iconv -f UCS-2BE -t UTF-8)
	sed -i "s/$msg/$decoded/g" inmsgs$curdatetime
done < cntn$curdatetime

cat inmsgs$curdatetime | json_pp

rm cntn$curdatetime
rm inmsgs$curdatetime
}

DeleteAllSms()
{
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
}

DeleteById()
{
ip="192.168.0.1"
tz="UTC-3"
curdatetime=`TZ=":$tz" date +'%y%m%d%H%M%S'`

curl -d "isTest=false&goformId=DELETE_SMS&msg_id=$2&notCallback=true" -H "X-Requested-With:XMLHttpRequest" -H "Referer:http://$ip/index.html" -X POST "http://$ip/goform/goform_set_cmd_process" --compressed --silent --output /dev/null

}

WriteSms()
{
phone=`printf %s $2 |jq -sRr @uri`
datetime=`TZ=":$tz" date +'%y;%m;%d;%H;%M;%S;'`
msg=$(printf "$3" | iconv -f UTF-8 -t UCS-2BE | xxd -p | tr -d '\n')

curl -d "isTest=false&goformId=SEND_SMS&notCallback=true&Number=$phone&sms_time=$datetime&MessageBody=$msg&ID=-1&encode_type=UNICODE" -H "X-Requested-With:XMLHttpRequest" -H "Referer:http://$ip/index.html" -X POST "http://$ip/goform/goform_set_cmd_process" --compressed --silent --output /dev/null

}

Help()
{
   # Display Help
   echo
   echo "options:"
   echo "c     Create sms. Example: -c +1234567890 'message' (Must be within ' !)"
   echo "a     Show all sms"
   echo "u     Show unread sms"
   echo "r     Show read sms"
   echo "s     Show sent sms"  
   echo "i     Delete sms by id. Example: -i 50"  
   echo "p     Delete all sms"     
   echo
}

OPTSTRING=":c::i::harsup"

while getopts ${OPTSTRING} opt; do
  case ${opt} in
      a) All;;
      u) Unread;;
      r) Read;;
      s) Sent;;
      p) DeleteAllSms;;
      i) DeleteById $1 $2;;
	  c) WriteSms $1 $2 "$3";;
	  h) Help;;
      :)
      echo "Option -${OPTARG} requires an argument."
      exit 1
      ;;
      ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;	  
   esac
done
