#!/bin/bash
# by Austin Hester

CURR=`dirname $0`
echo "I will back up your old file."
read -p "Are you sure you want to overwrite static-nodes? (yes/no):" -r
echo
if [[ $REPLY == "yes" ]]
then
if [ -e $CURR/enode/new-static-nodes.json ]; then
	echo "backing up..."
	cp -f $CURR/enode/static-nodes.json $CURR/enode/static-nodes.json.old
	cp $CURR/enode/new-static-nodes.json $CURR/enode/static-nodes.json
	rm -f $CURR/enode/new-static-nodes.json
	BOOT=$CURR/bootstrap/static-nodes.json
	MINER1=$CURR/miner1/static-nodes.json
	MINER2=$CURR/miner2/static-nodes.json
	echo "copying to" $BOOT &&
	cp $CURR/enode/static-nodes.json $BOOT &&
	echo "copying to" $MINER1 &&
	cp $CURR/enode/static-nodes.json $MINER1 &&
	echo "copying to" $MINER2 &&
	cp $CURR/enode/static-nodes.json $MINER2
else
	echo "Please initialize and run get_enodes.sh"
fi
else
	echo "quiting..."
fi



