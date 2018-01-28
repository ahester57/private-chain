# !/bin/bash

CURR=`dirname $0`
if [ -d $CURR/miner1/geth ]; then
geth --identity "miner1" --networkid 9111 \
     --datadir $CURR/miner1  \
     --ipcpath $CURR/miner1/geth.ipc \
     --nodiscover --port "39910" --rpc --rpcport "42025" \
     --rpcapi "db,eth,web3,net,personal,miner" \
     --unlock 0 --password $CURR/miner1/passwd.sec --mine
else
	echo "Initialize first"
fi
