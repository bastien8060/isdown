#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
BASEDIR=$(dirname "$0")
BD=$BASEDIR
while IFS= read -r l; do
	if [[ $l =~ ^#.* ]]; then
		printf "Checking dependencies...\n"
	elif [[ $l =~ ^~.* ]]; then
		p=${l:1}

		if command -v $p >/dev/null 2>&1 ; then
			printf "$p found\n"
		else	
			if [[ $p == "ping6" ]]; then
				cp $BD/ping6-arch /bin/ping6 >/dev/null 2>&1
				o=$?
				if [[ $o == "0" ]]; then
					echo "ping6 patched"
				else
					printf "${RED}error creating file at /bin/ping6${NC}\n" && exit 1
				fi
			else
				printf "${RED}$p not found${NC}\n" && exit 1
			fi
		fi

	else
		p=$l
		if [[ ! $(pacman -Q --info $p | grep Version) == "" ]] ; then 
			echo "$p found"
			echo $(pacman -Q --info $p | grep Version)
		else
			printf "${RED}$p not found. Check $p is installed${NC}\n" && exit 1
		fi
	fi
	printf "\n"
done < $BASEDIR/dependencies.list
