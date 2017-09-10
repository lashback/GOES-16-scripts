#!/bin/bash
mkdir bigimages
mkdir bigimages/conus/
mkdir data
cd data
mkdir conus
cd conus
# rm -rf *
# echo "Doing something"

YEAR=2017


#Julian Days — 252 is Sept 9
#hours are in GMT, or EST +5 
for JDAY in 251 252 253 254 255
do
# HOURS=('00' '01' '02' '03' '03' '04' '05' '06' '07' '08' '09' '10' '11' '12' '13' '14' '15' '16' '17' '18' '19' '20' '21' '22' '23' '24')
# echo hours: $HOURS
	for HOUR in '00' '01' '02' '03' '03' '04' '05' '06' '07' '08' '09' '10' '11' '12' '13' '14' '15' '16' '17' '18' '19' '20' '21' '22' '23' '24'
	do
		echo "eh"
		echo $YEAR
		echo $JDAY
		echo $HOUR

		# set FILES=`/usr/local/bin/aws s3 ls s3://noaa-goes16/ABI-L2-MCMIPF/$YEAR/$JDAY/ --no-sign-request --endpoint-url https://128.135.112.106:9000 --no-verify-ssl | tr -s " " | cut -d " " -f 4 | grep OR_ABI-L2-MCMIPF-`
		
		# FILES=`/usr/local/bin/aws s3 ls s3://noaa-goes16/ABI-L2-MCMIPC/$YEAR/$JDAY/$HOUR/ --no-sign-request --endpoint-url https://osdc.rcc.uchicago.edu --no-verify-ssl | tr -s " " | cut -d " " -f 4 | grep ABI-L2-MCMIPC-`
		/usr/local/bin/aws s3 sync s3://noaa-goes16/ABI-L2-MCMIPC/$YEAR/$JDAY/$HOUR/ . --no-sign-request --quiet --endpoint-url https://osdc.rcc.uchicago.edu --no-verify-ssl
		# echo $FILES
		# for FILE in $FILES
		# do
		# 		echo syncing $FILE
		# 		/usr/local/bin/aws s3 sync s3://noaa-goes16/ABI-L2-MCMIPC/$YEAR/$JDAY/$HOUR/$FILE . --no-sign-request --quiet --endpoint-url https://osdc.rcc.uchicago.edu --no-verify-ssl
		# 		DATESTRING=`echo $FILE | cut -d _ -f 4`
		# 		YEARF=`echo $DATESTRING | cut -c2-5`
		# 		JDAYF=`echo $DATESTRING | cut -c6-8`
		# 		HOURF=`echo $DATESTRING | cut -c9-10`
		# 		MINF=`echo $DATESTRING | cut -c11-12`
		# 		# set MONTHF=`date -v "$YEARF-01-01 $JDAYF days" +"%m"`
		# 		# set DAYF=`date -v "$YEARF-01-01 $JDAYF days" +"%d"`
		# 		echo DATESTRING: $DATESTRING
		# 		echo YEARF: $YEARF
		# 		echo JDAYF: $JDAYF
		# 		echo HOURF: $HOURF
		# 		echo MINF: $MINF
		# echo DAYF: $DAYF
	# echo MONTHF: $MONTHF
				# ../../plot_conus.py $FILE ../../images/conus/g16-$DATESTRING.png
	#scp g16-$YEARF-$MONTHF-$DAYF-$HOURF-$MINF.png somewhereelse
	done
done