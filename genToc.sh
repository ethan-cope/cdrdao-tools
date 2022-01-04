CDTITLE="Title" #put the CD title here
PERFORMER="Varies" #put the CD artists here

location=./$1
cd ${location}

FILES=*.wav

writeLine()
{
	echo -e $1 >> "CD.toc"
}

writeHeaders()
{
	echo "CD_DA" > "CD.toc"
	writeLine "CD_TEXT {"
	writeLine "\tLANGUAGE_MAP {0 : EN}"
	writeLine "\tLANGUAGE 0 {"
	writeLine "\t\tTITLE \"${CDTITLE}\""
	writeLine "\t\tPERFORMER \"${PERFORMER}\""
	writeLine "\t}\n}\n"
}

writeTrack()
{
	TITLE="${1:3}"
	TITLE="${TITLE%.*}"

	writeLine "TRACK AUDIO"
	writeLine "CD_TEXT { LANGUAGE 0 {"
	writeLine "\tTITLE \"${TITLE}\""
	writeLine "\tPERFORMER \"${2}\"}}"
	writeLine "FILE \"${1}\" 0"
	echo "" >> "CD.toc"
}

if [ $# -ne 0 ]
then
	writeHeaders

	for f in $FILES
	do
		writeTrack "${f}" "${PERFORMER}"
	done

	echo "Done!" 
	echo "next steps:"
	echo "1. Simulate burn with 'cdrdao simulate CD.toc'"
	echo "2. burn with 'cdrdao write --driver generic-mmc-raw --eject CD.toc'"
else
	echo "Enter a Directory to generate a TOC for!"
fi
