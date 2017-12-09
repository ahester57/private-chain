# !/bin/bash
# by Austin Hester

# Create 2 accounts for each node

CURR=`dirname $0`
BOOT=$CURR/bootstrap
MINER1=$CURR/miner1
MINER2=$CURR/miner2

if [[ -d $BOOT/geth/ && -d $MINER1/geth/ && -d $MINER2/geth/ ]]
then
read -p "Are you sure you want to create accounts? (yes/no):" -r
echo
if [[ $REPLY == "yes" ]]
then
	echo "Make sure to write down your passwords somewhere."
	echo "Run ./unlock_on_start.sh if you want to start each node"
	echo "with their coinbase account unlocked"
	read -p "" -r
	echo
	# bootstrap node
	echo "============================"
	echo "Bootstrap account #1"
	echo "============================"
	RIGHT=0
	while [[ $RIGHT == 0 ]]
	do
	geth --datadir $BOOT account new && > tmpasdf
	TEST=`cat tmpasdf | grep Fatal`
	if [[ $TEST == "" ]]; then
		RIGHT=1
	fi
	done	
	echo "============================"
	echo "Bootstrap account #2"
	echo "============================"
	RIGHT=0
	while [[ $RIGHT == 0 ]]
	do
	geth --datadir $BOOT account new && > tmpasdf
	TEST=`cat tmpasdf | grep Fatal`
	if [[ $TEST == "" ]]; then
		RIGHT=1
	fi
	done	
	# miner 1
	echo "============================"
	echo "Miner1 account #1"
	echo "============================"
	RIGHT=0
	while [[ $RIGHT == 0 ]]
	do
	geth --datadir $MINER1 account new && > tmpasdf
	TEST=`cat tmpasdf | grep Fatal`
	if [[ $TEST == "" ]]; then
		RIGHT=1
	fi
	done	
	echo "============================"
	echo "Miner1 account #2"
	echo "============================"
	RIGHT=0
	while [[ $RIGHT == 0 ]]
	do
	geth --datadir $MINER1 account new && > tmpasdf
	TEST=`cat tmpasdf | grep Fatal`
	if [[ $TEST == "" ]]; then
		RIGHT=1
	fi
	done	
	# miner 2
	echo "============================"
	echo "Miner2 account #1"
	echo "============================"
	RIGHT=0
	while [[ $RIGHT == 0 ]]
	do
	geth --datadir $MINER2 account new && > tmpasdf
	TEST=`cat tmpasdf | grep Fatal`
	if [[ $TEST == "" ]]; then
		RIGHT=1
	fi
	done	
	echo "============================"
	echo "Miner2 account #2"
	echo "============================"
	RIGHT=0
	while [[ $RIGHT == 0 ]]
	do
	geth --datadir $MINER2 account new &&> tmpasdf
	TEST=`cat tmpasdf | grep Fatal`
	if [[ $TEST == "" ]]; then
		RIGHT=1
	fi
	done	
	rm -f tmpasdf
else
	echo "quitting"
fi
else
	echo "You must initialize first. Run ./initialize_chain.sh"
fi
echo 
