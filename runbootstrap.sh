# !/bin/bash

CURR=`dirname $0`

NETWORK_ID=9111
PORT=39909
RPCPORT=42024

if [ -d $CURR/bootstrap/geth ]; then
geth --identity "bootstrap" --networkid $NETWORK_ID \
     --datadir $CURR/bootstrap  \
	 --nodiscover --syncmode "fast" \
     --ipcpath /home/$USER/.ethereum/geth.ipc \
     --port $PORT --rpc --rpcport $RPCPORT \
     --rpcapi "db,eth,web3,net,personal,miner" \
     --unlock 0 --password $CURR/bootstrap/passwd.sec \
     --preload "$CURR/scripts/mine_on_demand.js, \
     $CURR/scripts/loadIoTCoin.js, \
     $CURR/scripts/loadChainMessage.js" \
	 console
else
	echo "Initialize first"
fi
