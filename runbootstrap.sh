# !/bin/bash

CURR=`dirname $0`
if [ -d $CURR/bootstrap/geth ]; then
geth --identity "bootstrap" --networkid 9111 \
     --datadir $CURR/bootstrap  \
	 --nodiscover --syncmode "full" \
     --ipcpath /home/$USER/.ethereum/geth.ipc \
     --port "39909" --rpc --rpcport "42024" \
     --rpcapi "db,eth,web3,net,personal,miner" \
     --unlock "0xd6774f7daa52d2f38a9327ad8a4dd6f2f4e3f48b" \
	 --password $CURR/bootstrap/passwd.sec \
	 console
else
	echo "Initialize first"
fi
