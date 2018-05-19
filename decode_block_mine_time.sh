#!/bin/bash
# Austin Hester
# Give this script a text file containing a
# mining geth node's log and it will tell you
# the time the block took to be mined by you

if [[ -e $1 ]]; then
	IMPORTED=$1

	committedBlocks=($(grep -e "Commit new" $IMPORTED | awk '{print $7}' | awk -F "=" '{print $2}'))

	mined=($(grep -e "mined potential" $IMPORTED | awk '{print $2 " " $7}')) #| awk '{print $10" "$14}' #))

	#printf "%s %s\n" "${mined[@]}"
	#echo "${#committed[*]}"

	total=0
	i=0
	for block in ${committedBlocks[*]}; do
		temp=`printf "%s %s \n" "${mined[@]}" | grep $block`
		if [[ ! -z $temp ]]; then
			# display seconds of the time it committed mining network
		 	c=`grep -e "Commit new" $IMPORTED | awk '{print $2 " " $7}' \
		 	| grep -e "$block" | awk '{print $1}' | awk -F ":" '{print $3}' | sed -e 's/]//g'`
		 	echo $c
		 	# display seconds of the time it mined potential block
		 	m=`echo $temp | awk '{print $1}' | awk -F ":" '{print $3}' | sed -e 's/]//g'`
		 	echo $m

		 	elapsed=`expr $m - $c`
		 	if [[ $elapsed -lt 0 ]]; then
		 		elapsed=`expr 60 + $elapsed`
		 	fi

		 	echo $elapsed
		 	total=`expr $elapsed + $total`


		 	printf "********\n"
		 	# time ./. says it takes even longer if you don't print stuff out lol
		fi
		i+=2
	#	elapsed=${trim3[i]}
	#	echo -n $elapsed " "
	#	s=`echo $elapsed/1000 | node -p`
	#	cacheRate=`echo $size/$s | node -p`
	#	echo "kB/s = " $cacheRate
	#	total+=$cacheRate
	done
	numResults=`echo "${#mined[*]}"`
	#printf "%s \n" "${committedBlocks[@]}"
	echo $total
	echo $numResults
	echo $total/$numResults | node -p
fi
