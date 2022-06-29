#!/bin/bash

# Get sudo upfront
sudo -v

DL_DIR="/shared/Download"
DEST_DIR="/shared/Media/Movies"
VIDEO_EXT=("mp4" "mkv" "avi" "mov" "wmv" "flv" "webm")
PROCESS_COUNT=0
RENAME=''

cd $DL_DIR

# Loop over dirs
for DIR in */; do 
	# skip some dirs
	if [[ $DIR == '@Recycle/' ]] || [[ $DIR == 'temp/' ]]; then continue; fi

	# Only process YTS files
	if [[ ! $DIR =~ "[YTS." ]]; then continue; fi

	# strip out [*]
	RENAME="${DIR//\[*\]/}"

	# strip out trailing /
	RENAME="${RENAME/\//}"

	# trim trailing whitespace
	RENAME="$(echo -e "${RENAME}" | sed -e 's/[[:space:]]*$//')"

	cd "${DL_DIR}/${DIR}"

	for FILE in *; do
		for EXT in "${VIDEO_EXT[@]}"; do
			if [[ $FILE == *.${EXT} ]]; then

				# Rename movie file and move to destination directory
				sudo mv -i "${DL_DIR}/${DIR}${FILE}" "${DEST_DIR}/${RENAME}.${EXT}"
				printf "\nMOVING ${FILE} =====> ${DEST_DIR}/${RENAME}.${EXT}\n"

				# Delete orginal directory
				sudo rm -rf "${DL_DIR}/${DIR}"
				printf "DELETING Directory =====> ${DIR}\n\n"
				let PROCESS_COUNT++
			fi # IF $EXT
		done # end for each $EXT
	done # end for each $FILE
done # end for wach directory

printf "\nDone! ${PROCESS_COUNT} movie files processed.\n"
