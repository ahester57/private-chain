# !/bin/bash

CURR=`dirname $0`

NETWORK_ID=9111
PORT=39911
RPCPORT=42026

if [ -d $CURR/miner2/geth ]; then
geth --identity "miner2" --networkid $NETWORK_ID \
     --datadir $CURR/miner2  \
     --ipcpath $CURR/miner2/geth.ipc \
     --nodiscover --port $PORT --rpc --rpcport $RPCPORT \
     --rpcapi "db,eth,web3,net,personal,miner" \
     --unlock 0 --password $CURR/miner2/passwd.sec \
 	--preload "$CURR/scripts/mine_on_demand.js, \
	$CURR/scripts/loadChainMessage.js" console
else
	echo "Initialize first"
fi
