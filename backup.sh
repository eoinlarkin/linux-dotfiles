#!/bin/sh

# This script copy files mentioned inside `backup.conf` to the root of the project.
# Source: https://chandujs.dev/blog/backup-your-dotfiles-with-a-simple-bash-script-5hn2/

# file to look for the paths to backup.
backupPaths="./backup.conf"
# home directory path.
homeDirectory=~
# same line identifier to echo in the same line.
sameLine="\e[1A\e[K"

echo "🛑 Clearing configurations directory..."
# removing the folder with exsiting contents. we have git version anyway!
rm -rf dotconfig
# creating it again for backup.
mkdir dotconfig
sleep 1
echo -e "$sameLine✅ Configurations directory cleared."
sleep 1

echo -e "$sameLine🏁 Starting backup..."
sleep 1

# looping through the list & avoiding the empty spaces
sed '/^[ \t]*$/d' $backupPaths | while read filePath; do
  echo -e "$sameLine⏳ Copying: $filePath"

  # find & replace for ~ with home path
  findThis="~/"
  replaceWith="$homeDirectory/"
  originalFile="${filePath//${findThis}/${replaceWith}}"
  
  # copying the files
  cp --parents --recursive $originalFile ./dotconfig
  sleep 0.05
done

git add .

echo -e "$sameLine🎉 Backup finished! You can review & commit your changes."
