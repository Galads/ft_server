#!/bin/bash

val=$1
defineOn="on"
defineOff="off"
grepLine=$(cat /etc/nginx/sites-available/tfile)

echo "already set index $grepLine"

if [ $val = $defineOn ]
then
   echo "index 1: $1"
elif [ $val = $defineOff ]
then
   echo "index 2: $1"
fi