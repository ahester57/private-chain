#!/bin/bash

CURR=`dirname $0`
BOOT=$CURR/../bootstrap
MINER1=$CURR/../miner1
MINER2=$CURR/../miner2
TEST=$CURR/../testnode

# Get the block number
BLOCKNUM=`node getBlockNumber.js`
echo $BLOCKNUM

# Add a comma if this isn't the first entry
if [ -a storage.json ]; then
	echo "," >> storage.json
fi

# Create new JSON object with blocknum as key
echo -n "\"$BLOCKNUM\": " >> storage.json
echo "{" >> storage.json
echo

# Bootstrap storage info
echo "$CURR/bootstrap"
echo -n "\"bootstrap\": " >> storage.json
echo "*****************************"

# Get list of file sizes
B=`ls -lh --block-size=KB $BOOT/geth/*/ | awk '{print $5}'`
echo $B

# The following creates a json array of the storage
# taken up by the node
TEMP=""
echo "[ " >> storage.json
echo -n "    " >> storage.json
for s in $B; do
	if [ ! -z $TEMP ]; then
		echo -n "\"$TEMP\", " >> storage.json
	fi
	TEMP=$s
done
if [ ! -z $TEMP ]; then
	echo "\"$TEMP\"" >> storage.json
fi
echo "]," >> storage.json


echo "*****************************"
echo 
echo "$CURR/miner1"
echo -n "\"miner1\": " >> storage.json
echo "*****************************"

M1=`ls -lh --block-size=KB $MINER1/geth/*/ | awk '{print $5}'`
echo $M1

# The following creates a json array of the storage
# taken up by the node
TEMP=""
echo "[ " >> storage.json
echo -n "    " >> storage.json
for s in $M1; do
	if [ ! -z $TEMP ]; then
		echo -n "\"$TEMP\", " >> storage.json
	fi
	TEMP=$s
done
if [ ! -z $TEMP ]; then
	echo "\"$TEMP\"" >> storage.json
fi
echo "]," >> storage.json


echo "*****************************"
echo 
echo "$CURR/miner2"
echo -n "\"miner2\": " >> storage.json
echo "*****************************"

M2=`ls -lh --block-size=KB $MINER2/geth/*/ | awk '{print $5}'`
echo $M2

# The following creates a json array of the storage
# taken up by the node
TEMP=""
echo "[ " >> storage.json
echo -n "    " >> storage.json
for s in $M2; do
	if [ ! -z $TEMP ]; then
		echo -n "\"$TEMP\", " >> storage.json
	fi
	TEMP=$s
done
if [ ! -z $TEMP ]; then
	echo "\"$TEMP\"" >> storage.json
fi
echo "]," >> storage.json


echo "*****************************"
echo 
echo "$CURR/testnode"
echo -n "\"testnode\": " >> storage.json
echo "*****************************"

TST=`ls -lh --block-size=KB $TEST/geth/*/ | awk '{print $5}'`
echo $TST 

# The following creates a json array of the storage
# taken up by the node
TEMP=""
echo "[ " >> storage.json
echo -n "    " >> storage.json
for s in $TST; do
	if [ ! -z $TEMP ]; then
		echo -n "\"$TEMP\", " >> storage.json
	fi
	TEMP=$s
done
if [ ! -z $TEMP ]; then
	echo "\"$TEMP\"" >> storage.json
fi
echo "]" >> storage.json

echo "*****************************"
# End the JSON object with key $BLOCKNUM
echo "}" >> storage.json

