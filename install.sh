#!/bin/sh

readonly username=$(who am i | awk '{ print $1 }')
readonly runpath="/Users/$username/.runscript"

# remove if folder exists
installed=$(ls -al /Users/"$username"/ | grep .runscript | wc -l | awk '{ print $1 }')
if [ "$installed" = 1 ] ; then
	rm -rf "$runpath"
fi

# get source files
git clone https://github.com/Allen-Hu/RunScript.git "$runpath"

# add folder to path
has_path=$(cat /etc/paths | grep "runpath" | wc -l | awk '{ print $1 }')
if [ "$has_path" = 0 ] ; then
	sh -c "echo $runpath >> /etc/paths"
fi

# give executing permissions
chmod a+x "$runpath"/run
