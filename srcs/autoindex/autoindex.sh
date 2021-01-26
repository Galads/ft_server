#!/bin/bash
val=$1
defineOn="on"
defineOff="off"
grepLine=$(grep "autoindex" test.loc | cut -c13-14)

checkSetAlready ()
{
	if [ $grepLine = $1 ]
	then
		echo "index already set, exit"
		exit 1
	fi
}

if [ -z $val ]
then
	echo "Error, argument not found"
	exit 1
fi

if [ $val = $defineOn ]
then
	checkSetAlready on
	sed -i 's/autoindex off/autoindex on/' test.loc
	echo "index set: $1"
elif [ $val = $defineOff ]
then
	checkSetAlready of
	sed -i 's/autoindex on/autoindex off/' test.loc
	echo "index set: $1"
else
	echo "Valid argument not found"
fi