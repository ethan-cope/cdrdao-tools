#! /bin/bash

location=./$1
cd $location

FILES=*.wav
if [ $# -ne 0 ] && [ $# -ne 1 ]
then
	for f in $FILES;
	do
		NUM=${f:0:2} 

		if [ ${NUM:0:1} -eq 0 ]
		then
			NUM=${NUM:1}
		fi

		((OUT=$NUM+$2))
		NAME=${f:3} #this strips off a 2-digit number plus a space

		if [ ${#OUT} -eq 1 ]
		then
			OUT=0${OUT}
		fi

		OUT="${OUT} ${NAME}"
		mv "${f}" "${OUT}"
	done
	echo "Done!"
else
	echo "You need to enter a Directory to shift and a number to shift by!"
	echo "Ex: ./songShift.sh ./AlbumDir -1 will shift all songs in ./Albumdir by -1."

fi
