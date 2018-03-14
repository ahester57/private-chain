# !/bin/bash
# by Austin Hester

# get enodes

CURR=`dirname $0`

echo "I will backup your old one."
read -p "Are you sure you want to an empty genesis.json? (yes/no):" -r

# generate static-nodes.json
if [ $REPLY == "yes" ]; then
	echo "backing up..."
	cp -f genesis.json.old genesis.json.older
	cp -f genesis.json genesis.json.old
	echo "{" > $CURR/genesis.json
  	echo "  \"alloc\"      : {}," >> $CURR/genesis.json
  	echo "  \"coinbase\"   :	\"0x0000000000000000000000000000000000000000\"," \
	>> $CURR/genesis.json
	echo "  \"difficulty\" : \"0x920000\"," >> $CURR/genesis.json
	echo "  \"extraData\"  : \"\"," >> $CURR/genesis.json
	echo "  \"gasLimit\"   : \"0xff2fefd8\"," >> $CURR/genesis.json
	echo "  \"nonce\"      : \"0x0000004200000042\"," >> $CURR/genesis.json
	echo "  \"mixhash\"    :	\"0x0000000000000000000000000000000000000000000000000000000000000000\"," \
	>> $CURR/genesis.json
	echo "  \"parentHash\" :\"0x0000000000000000000000000000000000000000000000000000000000000000\","\
	>> $CURR/genesis.json
	echo "  \"timestamp\"  : \"0x00\"," >> $CURR/genesis.json
	echo "  \"config\" : {" >> $CURR/genesis.json
		echo "    \"chainId\": <arbitraty, not 1>," >> $CURR/genesis.json
		echo "    \"homesteadBlock\" : 0," >> $CURR/genesis.json
		echo "    \"eip155Block\": 0," >> $CURR/genesis.json
		echo "    \"eip158Block\": 0" >> $CURR/genesis.json
	echo "}" >> $CURR/genesis.json
	echo "}" >> $CURR/genesis.json
	echo "Wrote to " $CURR"/genesis.json"
	echo "Done."
else
	echo "quitting"
fi
