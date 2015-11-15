#!/bin/bash 


function green { echo "[32m$1[00m"; }
function red { echo "[31m$1[00m"; }


function push
{
dir=$(dirname "$1")
if [ ! -d $dir ] 
then 
#red "create $dir"
mkdir -p "$dir" 
fi
cp "/$1" "$dir"
}


mkdir -p jail
pushd jail

##   Essential ###
push lib64/ld-linux-x86-64.so.2
push lib32/ld-linux.so.2
cp ../Dockerfile .
mkdir -p bin sbin
###############################

for a in "$@"
do
	for b in $(LD_TRACE_LOADED_OBJECTS=1 $a | awk '/=>/{print $3}')
	do
	### Push all lib
	green "${b}"
	push "${b#\/}"
	done

### Finally Push bin
red "${a}"
push "${a#\/}" 
done

popd
