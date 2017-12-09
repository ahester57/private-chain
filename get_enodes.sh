# !/bin/bash
# by Austin Hester

# get enodes

CURR=`dirname $0`
BOOT=$CURR/bootstrap
MINER1=$CURR/miner1
MINER2=$CURR/miner2
if [[ -d $BOOT/geth/ && -d $MINER1/geth/ && -d $MINER2/geth/ ]] 
then
IPPREFIX=`ip route | grep default | awk -F " " '{print $3 }' | awk '{print substr($1,1,4) }'`
IP=`ifconfig | grep $IPPREFIX | awk -F: '{ print $2 }' | awk -F " " '{ print $1 }'`
echo $IP
# bootstrap node
if [ -d $BOOT/geth/ ]; then
	BOOTIPC=/home/$USER/.ethereum/geth.ipc
	if [ -e $BOOTIPC ]; then
		BOOTENODE=`geth --exec admin.nodeInfo.enode attach $BOOTIPC`
	else
		BOOTENODE=`geth --datadir $BOOT --port 39909 --exec admin.nodeInfo.enode console`
	fi
	BOOTENODE=`echo $BOOTENODE | sed 's/\[\:\:\]/'$IP'/g' | sed 's/?discport=0//'`
else
	echo "bootstrap not initialized."
fi
# miner 1
if [ -d $MINER1/geth/ ]; then
	if [ -e $MINER1/geth.ipc ]; then
		M1ENODE=`geth --exec admin.nodeInfo.enode attach $MINER1/geth.ipc`
	else
		M1ENODE=`geth --datadir $MINER1 --port 39910 --exec admin.nodeInfo.enode console`
	fi
	M1ENODE=`echo $M1ENODE | sed 's/\[\:\:\]/'$IP'/g' | sed 's/?discport=0//'`
else
	echo "miner1 not initialized."
fi
# miner 2
if [ -d $MINER2/geth/ ]; then
	if [ -e $MINER2/geth.ipc ]; then
		M2ENODE=`geth --exec admin.nodeInfo.enode attach $MINER2/geth.ipc`
	else
		M2ENODE=`geth --datadir $MINER2 --port 39911 --exec admin.nodeInfo.enode console`
	fi
	M2ENODE=`echo $M2ENODE | sed 's/\[\:\:\]/'$IP'/g' | sed 's/?discport=0//'`
else
	echo "miner2 not initialized."
fi
echo "Bootstrap:"
echo $BOOTENODE
echo "Miner1:"
echo $M1ENODE
echo "Miner2:"
echo $M2ENODE

# generate static-nodes.json
if ! [ -d $CURR/enode ]; then
	mkdir $CURR/enode
fi
echo "[" > $CURR/enode/new-static-nodes.json
echo $BOOTENODE"," >> $CURR/enode/new-static-nodes.json
echo $M1ENODE"," >> $CURR/enode/new-static-nodes.json
echo $M2ENODE >> $CURR/enode/new-static-nodes.json
echo "]" >> $CURR/enode/new-static-nodes.json
echo
echo "Wrote enodes to "$CURR"/enode/new-static-nodes.json"
echo "Run "$CURR"/copy_static_nodes.sh to update"
echo

else
	echo "Initialize first"
fi
