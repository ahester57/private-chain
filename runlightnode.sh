# !/bin/bash

CURR=`dirname $0`
if [ -d $CURR/lightnode/geth ]; then
geth --identity "lightnode" --networkid 9111 \
     --datadir $CURR/lightnode  \
	 --nodiscover \
	 --syncmode "fast" \
     --ipcpath $CURR/lightnode/geth.ipc \
     --port "39908" --rpc --rpcport "42023" \
     --rpcapi "db,eth,web3,net,personal,miner" \
     --unlock 0 --password $CURR/lightnode/passwd.sec \
	 console
else
	echo "Initialize first"
fi
