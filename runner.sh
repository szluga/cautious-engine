#!/bin/bash
set -o errexit


# setup
clear;
arg=$1

# argument check
isarg(){

	arg=$1
	
	if [ -z $arg ]; then
		echo "Argument is empty!";
		echo "exit code 1";
		exit 1;

	else 
		if [ ! -f $arg ]; then 
			echo "File not found!";
			echo "exit code 2";
			exit 2;
		
		else
			printer $arg

		fi
	
	fi

}


# printing results
printer() {

	file=$1;

	# setting colors
	RED="\033[0;31m";
	BLUE="\033[0;34m";
	GREEN="\033[0;32m";
	NC="\033[0m";

	echo " ";

	while read line; 
	do
		
		ip=$(echo $line | cut -f1 -d' ');
		cmd=$(echo $line | cut -f2 -d' ');
		args=$(echo $line | awk -F $cmd' ' '{print $2}');	

		echo -e "Starting ${RED}$cmd${NC} with '${BLUE}$args${NC}' on node ${GREEN}$ip${NC}";
	
	done < $file;

	echo " ";
	exit 0;

}


# main
isarg $arg

