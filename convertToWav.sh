#! /bin/bash

location=./$1
cd $location

FILES=*.m4a

#change this to whichever extension you need to convert!
#TODO: some .wav files don't work with CDRDAO for whatever reason. 
#re-converting them with this program will make them work though.

if [ $# -ne 0 ] 
then
	for f in $FILES
	do
		FNAME="${f%.*}".wav
		echo $FNAME

		ffmpeg -i "${f}" -f wav -ar 44100 -ac 2 out.wav
		mv out.wav "${FNAME}"
	done
else
	echo "You need to Enter a Directory that contains files to convert!"
fi
