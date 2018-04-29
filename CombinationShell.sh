#!/bin/bash
# run this with $bash CominationShell.sh
# run this script in a directory where you have files that all have a filename of the form NAME+#+EXTENTION
RUN=1
FRONT="PbGl_data" #put the file name here 
BACK=".txt" #put the extension here
START=2 #put the number of the file you want to start iternating at here
FILENUMBER=$START
let "START++"
PRINT=""
while [ $RUN -eq 1 ]; do
	NAME=$FRONT$FILENUMBER$BACK
	if [ -e $NAME ]; 
	then
		let "FILENUMBER++"
	else
		RUN=0
	fi
done
>PbGl_dataC.txt #the name of the file you want to output 
FILE2=$((FILENUMBER-1))
while [[ $FILENUMBER -ge $START ]]; do
	#					The filepath to the directory you are in
	mv /home/user/Dropbox/Nagel/FLTBAnalysis/PbGl_data{$FILE2,$FILENUMBER}.txt #moves file 2 into file 3 and 3 to 4 ...
	echo $"$FRONT$FILENUMBER$BACK">>PbGl_dataC.txt  #outfile
	let "FILENUMBER--"
	FILE2=$((FILENUMBER-1))
done