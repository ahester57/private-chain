# !/bin/bash

CURR=`dirname $0`
if [ -d $CURR/miner2/geth ]; then
geth --identity "miner2" --networkid 9111 \
     --datadir $CURR/miner2  \
     --ipcpath $CURR/miner2/geth.ipc \
     --nodiscover --port "39911" --rpc --rpcport "42026" \
     --rpcapi "db,eth,web3,net,personal,miner" \
     --unlock 0 --password $CURR/miner2/passwd.sec \
	 --preload "$CURR/scripts/mine_on_demand.js" console
else
	echo "Initialize first"
fi
