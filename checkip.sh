#!/bin/bash

strAPIResponse=$(curl http://ip-api.com/csv/?fields=8193)
strCountry=$(echo $strAPIResponse | awk -F "," '{print $1}')
strIp=$(echo $strAPIResponse | awk -F "," '{print $2}')

zenity --info --width=250 --text="IP: ${strIp}\nCountry: ${strCountry}" --title=IP Info
