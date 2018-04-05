# !/bin/bash

CURR=`dirname $0`

NETWORK_ID=9111
PORT=39910
RPCPORT=42025

if [ -d $CURR/miner1/geth ]; then
geth --identity "miner1" --networkid $NETWORK_ID \
     --datadir $CURR/miner1  \
     --ipcpath $CURR/miner1/geth.ipc \
     --nodiscover --port $PORT --rpc --rpcport $RPCPORT \
     --rpcapi "db,eth,web3,net,personal,miner" \
     --unlock 0 --password $CURR/miner1/passwd.sec \
 	--preload "$CURR/scripts/mine_on_demand.js" console
else
	echo "Initialize first"
fi
