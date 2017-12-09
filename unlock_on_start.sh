# !/bin/bash
# by Austin Hester

# Unlock coinbase for each node on start

CURR=`dirname $0`
BOOT=$CURR/bootstrap
MINER1=$CURR/miner1
MINER2=$CURR/miner2

if [[ -d $BOOT/geth/ && -d $MINER1/geth/ && -d $MINER2/geth/ ]]
then
read -p "Are you sure you want to unlock accounts? (yes/no):" -r
echo
if [[ $REPLY == "yes" ]]
then
	# bootstrap node
	echo "============================"
	echo "Bootstrap coinbase" 
	echo "============================"
	echo -n "Enter password for bootstrap account #1: "
	read -s -r
	echo
	echo $REPLY > $BOOT/passwd.sec
	chmod 600 $BOOT/passwd.sec
	# miner 1
	echo "============================"
	echo "Miner1 coinbase"
	echo "============================"
	echo -n "Enter password for miner1 account #1: "
	read -s -r
	echo
	echo $REPLY > $MINER1/passwd.sec
	chmod 600 $MINER1/passwd.sec
	# miner 2
	echo "============================"
	echo "Miner2 coinbase"
	echo "============================"
	echo -n "Enter password for miner2 account #1: "
	read -s -r
	echo
	echo $REPLY > $MINER2/passwd.sec
	chmod 600 $MINER2/passwd.sec
else
	echo "quitting"
fi
else
	echo "You must initialize first. Run ./initialize_chain.sh"
fi
echo 
