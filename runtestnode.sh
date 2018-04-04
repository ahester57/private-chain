# !/bin/bash

# Directory stuff
CURR=`dirname $0`
DATADIR=$CURR/testnode

# GETH options 
IDENTITY="austin_laptop"
NETWORKID=9111
UDPPORT=30303
RPCPORT=42023
COINBASE="0x..."

if [ -d $DATADIR/geth ]; then
geth --identity $IDENTITY --networkid $NETWORKID \
     --datadir $DATADIR --syncmode "fast" \
     --ipcpath $DATADIR/geth.ipc \
     --nodiscover --port $UDPPORT --rpc --rpcport $RPCPORT \
     --rpcapi "db,eth,web3,net,personal,miner" \
     --unlock 0 --password $DATADIR/passwd.sec \
	 --preload "$CURR/scripts/loadIoTCoin.js", \
	 "$CURR/scripts/loadChainMessage.js" \
	console
     #--unlock $COINBASE --password $DATADIR/passwd.sec \
else
	echo "Initialize first"
fi
