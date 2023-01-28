#!/bin/sh

# starting backup notification
echo "Starting backup 🏁"

# loop through files and passing to rsync
cat backup.conf | while read line
do
	echo $line
	rsync -ai --relative -mkpath $HOME/./$line dotfiles/
done

# complete status notification
echo "Backup complete ✅"
