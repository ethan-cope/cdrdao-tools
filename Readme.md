# How to use cdrdao-tools
this is a set of shell scripts to make cdrdao easier to use for everyday CD burning.

## converting files to wav
cdrdao requires all music files to be of .wav format. 
If your files aren't in .wav format, **convertToWav.sh** automates this conversion.
usage:
- change the `FILES` variable to whichever extension you'd like to convert from
- convert songs with `convertToWav.sh (album directory)`
- note: sometimes cdrdao doesn't like certain .wav files. using this program on .wav files will correct this error.

## shifting numbers of files
if you want to combine 2 short albums onto one disc, you probably don't want to manually rename each song to reflect the track order. 
Shift all .wav files with **songShift.sh**
usage:
- `songShift.sh (album directory) (number to shift songs by)`

## generating toc files
toc files, a necessity for disk-at-once burning, are tedious and difficult to write. 
`genToc.sh` automates this process by generating a toc file for all .wav files in a directory. 
usage:
- genToc.sh (directory of .wav files to be burned.)

## burning the CD
for a more in-depth guide on burning a CD, check out my blog post [here](deadlink)

