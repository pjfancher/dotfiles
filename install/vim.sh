#!/bin/bash

install_plugins() {
    declare -r VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"
    declare -r VUNDLE_GIT_REPO_URL="https://github.com/VundleVim/Vundle.vim.git"

    # Install plugins.
    execute \
        "rm -rf '$VUNDLE_DIR' \
            && mkdir '$HOME'/.vim/undo/ \
            && git clone --quiet '$VUNDLE_GIT_REPO_URL' '$VUNDLE_DIR' \
            && printf '\n' | vim +PluginInstall +qall" \
        "Installing plugins" \
        || return 1
}

update_plugins() {
    execute \
        "vim +PluginUpdate +qall" \
        "Updating plugins"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n   Vim\n   ------------------------------\n"
    install_plugins
}

main
