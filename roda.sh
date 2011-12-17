#!/bin/bash
echo "Bash version ${BASH_VERSION}..."
base="/mnt/server-atlas/"
for name in $(find $($base"desligados") -mtime +90);
do 
	if [[ ! -d `$base$(dirname $name)` ]]; then
		newdir=$base$(dirname $name);
#		mkdir -p "$newdir";
		echo "Criando if $name"
		sleep 2
	else
		echo "Criado else $name"
		sleep 2
	fi
done

