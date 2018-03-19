# !/bin/bash

# Directory stuff
CURR=`dirname $0`
DATADIR=$CURR/lightnode

# GETH options 
IDENTITY="lightnode"
NETWORKID=9111
UDPPORT=39908
RPCPORT=42023
COINBASE="0x..."

if [ -d $DATADIR/geth ]; then
geth --identity $IDENTITY --networkid $NETWORKID \
     --datadir $DATADIR --syncmode "fast" \
     --ipcpath $DATADIR/geth.ipc \
     --nodiscover --port $UDPPORT --rpc --rpcport $RPCPORT \
     --rpcapi "db,eth,web3,net,personal,miner" \
     --unlock 0 --password $DATADIR/passwd.sec \
	console
     #--unlock $COINBASE --password $DATADIR/passwd.sec \
else
	echo "Initialize first"
fi
