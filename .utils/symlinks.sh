#!/bin/bash

# this symlinks all the dotfiles (and .vim/) to ~/

# finds all .dotfiles in this folder
declare -a FILES_TO_SYMLINK=$(find . -type f -maxdepth 1 -name ".*" -not -name .DS_Store -not -name .git -not -name .osx | sed -e 's|//|/|' | sed -e 's|./.|.|')
FILES_TO_SYMLINK="$FILES_TO_SYMLINK .vim .zsh" # add in vim and the binaries

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Symlinks\n\n"

    local i=""
    local sourceFile=""
    local targetFile=""

    for i in ${FILES_TO_SYMLINK[@]}; do

        sourceFile="$(pwd)/$i"
        targetFile="$HOME/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ -e "$targetFile" ]; then
            if [ "$(readlink "$targetFile")" != "$sourceFile" ]; then

                rm -rf "$targetFile"
                execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"

            else
                print_success "$targetFile → $sourceFile"
            fi
        else
            execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        fi
    done
}

main
