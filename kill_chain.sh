#!/bin/bash
# by Austin Hester
# tired of wasting time killing process one at a time????????
# boy! do i have the solution for you!

# this script:
# > looks for geth's, kills it

GETH=`ps -a | grep geth | awk 'NR==1{ print $1 }'`
if [[ $GETH != "" ]]
then
read -p "Are you sure you want to kill running geth instances? (yes/no):" -r
echo
if [[ $REPLY == "yes" ]]
then
	GETH=`ps -a | grep geth | awk 'NR==1{ print $1 }'`
	while [ "$GETH" != "" ]; do
		echo "Killing" $GETH "..." &&
		kill -9 $GETH || true &&
		echo "Killed geth w/ PID=" $GETH "."
		GETH=`ps -a | grep geth | awk 'NR==1{ print $1 }'`
	done
else
	echo "cancelling"
fi
else
	echo "No running instances."
fi
