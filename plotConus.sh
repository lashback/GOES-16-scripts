#!/bin/bash
cd data/conus
# FILES=
for FILE in *.nc
do
	# echo syncing $FILE
	# /usr/local/bin/aws s3 sync s3://noaa-goes16/ABI-L2-MCMIPC/$YEAR/$JDAY/$HOUR/$FILE . --no-sign-request --quiet --endpoint-url https://osdc.rcc.uchicago.edu --no-verify-ssl
	DATESTRING=`echo $FILE | cut -d _ -f 4`
	YEARF=`echo $DATESTRING | cut -c2-5`
	JDAYF=`echo $DATESTRING | cut -c6-8`
	HOURF=`echo $DATESTRING | cut -c9-10`
	MINF=`echo $DATESTRING | cut -c11-12`
	# set MONTHF=`date -v "$YEARF-01-01 $JDAYF days" +"%m"`
	# set DAYF=`date -v "$YEARF-01-01 $JDAYF days" +"%d"`
	# echo DATESTRING: $DATESTRING
	# echo $YEARF-$JDAYF-$HOURF-$MINF
	# echo JDAYF: $JDAYF
	# echo HOURF: $HOURF
	# echo MINF: $MINF
	../../plot_conus.py $FILE ../../bigimages/conus/g16-$YEARF-$JDAYF-$HOURF-$MINF.png
done