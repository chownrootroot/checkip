#!/bin/bash

strAPIResponse=$(curl http://ip-api.com/csv/?fields=status,country,isp,query)

strStatus=$(echo $strAPIResponse | awk -F "," '{print $1}')
strCountry=$(echo $strAPIResponse | awk -F "," '{print $2}')
strIsp=$(echo $strAPIResponse | awk -F "," '{print $3}')
strIp=$(echo $strAPIResponse | awk -F "," '{print $4}')

if [ "${strStatus}" = "success" ]; then
	zenity --info --width=250 --text="IP: ${strIp}\nCountry: ${strCountry}\nISP: ${strIsp}" --title=IP Info
else
	zenity --info --width=250 --text="Query failed" --title=IP Info
fi

exit 0
