# !/bin/bash

CURR=`dirname $0`
if [ -d $CURR/bootstrap/geth ]; then
geth --identity "bootstrap" --networkid 9111 \
     --datadir $CURR/bootstrap  \
     --ipcpath /home/$USER/.ethereum/geth.ipc \
     --nodiscover --port "39909" --rpc --rpcport "42024" \
     --rpcapi "db,eth,web3,net,personal,miner" \
     --unlock 0 --password $CURR/bootstrap/passwd.sec 
else
	echo "Initialize first"
fi
