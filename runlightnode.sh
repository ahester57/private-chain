# !/bin/bash

# Directory stuff
CURR=`dirname $0`
DATADIR=$CURR/lightnode
<<<<<<< HEAD

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
=======
if [ -d $DATADIR/geth ]; then
geth --identity "billclinton" --networkid 9111 \
     --datadir $DATADIR  \
	 --nodiscover \
	 --syncmode "fast" \
     --ipcpath $DATADIR/geth.ipc \
     --port "39908" --rpc --rpcport "42023" \
     --rpcapi "db,eth,web3,net,personal,miner" \
     --unlock 0 --password $DATADIR/passwd.sec \
	 console
>>>>>>> fb6987fa364b3137bf828e74a09c9bd480f0bd3c
else
	echo "Initialize first"
fi
