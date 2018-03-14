# !/bin/bash
# by Austin Hester

# Initializes geth chain with genesis.json

CURR=`dirname $0`
if [ -e $CURR/genesis.json ]; then
read -p "Are you sure you want to initialize the chain? (yes/no):" -r
echo
if [[ $REPLY == "yes" ]]
then
	# bootstrap node
	BOOT=$CURR/bootstrap
	if ! [ -d $BOOT ]; then
		mkdir -p $BOOT
	fi
	if ! [ -d $BOOT/geth ]; then
		geth --datadir ./bootstrap init genesis.json
	else
		echo "bootstrap already initialized."
	fi
	# miner 1
	MINER1=$CURR/miner1
	if ! [ -d $MINER1 ]; then
		mkdir -p $MINER1
	fi
	if ! [ -d $MINER1/geth ]; then
		geth --datadir ./miner1 init genesis.json 
	else
		echo "miner1 already initialized."
	fi
	# miner 2
	MINER2=$CURR/miner2
	if ! [ -d $MINER2 ]; then
		mkdir -p $MINER2
	fi
	if ! [ -d $MINER2/geth ]; then
		geth --datadir ./miner2 init genesis.json
	else
		echo "miner2 already initialized."
	fi
	echo "Done."
else
	echo "quitting"
fi
else
	echo "File "$CURR/genesis.json" not found."
	echo "Generate genesis.json by running ./generate_genesis.sh"
fi
