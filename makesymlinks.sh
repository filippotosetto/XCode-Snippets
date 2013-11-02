#!/bin/bash
############################
# .make.sh
# This script creates symlinks from this folder to xcode code snippets
############################

########## Variables

dir=~/Projects/Xcode-Snippets                    # dotfiles directory
olddir=~/Projects/Xcode-Snippets_old             # old dotfiles backup directory
xcodedir=~/Library/Developer/Xcode/UserData/CodeSnippets

files=""
for file in $dir/*.codesnippet
do
    files="$files ${file##*/}"
done
echo $files

##########

# create xcode_old
echo -n "Creating $olddir for backup..."
mkdir -p $olddir
echo "done"

# create CodeSnippets folder
echo -n "Creating $xcodedir..."
mkdir -p $olddir
echo "done"


# change to the XCode-Snippets directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"


# move any existing snippets inot backeup directory, then create symlinks from the here to any files in the xcode directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv $xcodedir/$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file $xcodedir/$file
done