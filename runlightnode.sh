# !/bin/bash

CURR=`dirname $0`
DATADIR=$CURR/lightnode
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
else
	echo "Initialize first"
fi
