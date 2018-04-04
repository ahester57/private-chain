# !/bin/bash

CURR=`dirname $0`
if [ -d $CURR/bootstrap/geth ]; then
geth --identity "bootstrap" --networkid 9111 \
     --datadir $CURR/bootstrap  \
	 --nodiscover --syncmode "fast" \
     --ipcpath /home/$USER/.ethereum/geth.ipc \
     --port "39909" --rpc --rpcport "42024" \
     --rpcapi "db,eth,web3,net,personal,miner" \
     --unlock 0 --password $CURR/bootstrap/passwd.sec \
     --preload "$CURR/scripts/mine_on_demand.js" \
     --preload "$CURR/scripts/loadIoTCoin.js" \
     --preload "$CURR/scripts/loadChainMessage.js" \
	 console
else
	echo "Initialize first"
fi
