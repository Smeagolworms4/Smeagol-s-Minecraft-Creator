#!/bin/bash

#VERBOSE=v

rm -rf$VERBOSE tmp 2> /dev/null
git clone https://github.com/Smeagolworms4/RaptorFramework.git tmp
cd tmp/
for CONTENT in * .*; do
	if [ "." != "$CONTENT" -a ".." != "$CONTENT" ]; then
		echo "Install $CONTENT => editor/$CONTENT";
		COPY="0"
		if [ -e ../editor/$CONTENT ]; then
			read -p "editor/$CONTENT already exist. Do you want replace ? [Y-n] " CHOICE
			if [ "$CHOICE" != "n" -a "$CHOICE" != "N" ]; then
				COPY="1"
				rm -r$VERBOSEv ../editor/$CONTENT 2> /dev/null
			fi;		
		else
			COPY="1"
		fi;
		
		if [ "$COPY" != "0" ]; then
			cp -r$VERBOSEf $CONTENT ../editor/
		fi;
	fi;
done

cd ..
rm -rf$VERBOSE tmp 2> /dev/null

echo "."
echo "========================"
echo "= Installation terminé ="
echo "========================"
