#!/bin/bash
val=$1
defineOn="on"
defineOff="off"
cd /etc/nginx/sites-available
grepLine=$(grep "autoindex" test.loc | cut -c13-14)

checkSetAlready ()
{
	if [ $grepLine = $1 ]
	then
		echo "index already set, exit"
		cd -
		exit 1
	fi
}

if [ -z $val ]
then
	echo "Error, argument not found"
	cd -
	exit 1
fi

if [ $val = $defineOn ]
then
	checkSetAlready on
	sed -i 's/autoindex off/autoindex on/' test.loc
	echo "index set: $1"
	service nginx restart
	cd -
elif [ $val = $defineOff ]
then
	checkSetAlready of
	sed -i 's/autoindex on/autoindex off/' test.loc
	echo "index set: $1"
	service nginx restart
	cd -
else
	echo "Valid argument not found"
	cd -
fi