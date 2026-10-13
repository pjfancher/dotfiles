#!/bin/bash

# Pick which GitHub account this machine commits and authenticates as.
#
# Identity and the gh credential helper go in ~/.gitconfig.local, which is
# machine-specific (not tracked) and included by ~/.gitconfig.
#
# Re-run any time to switch: ~/dotfiles/install/github.sh [personal|work]

type print_in_purple &> /dev/null \
    || . "$(dirname "${BASH_SOURCE[0]}")/utils.sh"

GITCONFIG_LOCAL="$HOME/.gitconfig.local"
GIT_NAME="PJ Fancher"

# label|github user|commit email
GITHUB_PROFILES=(
    "personal|pjfancher|peejfancher@gmail.com"
    "work|db-pj|pj@digitalbrands.com"
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Sets GH_LABEL, GH_USER and GH_EMAIL from a menu number or label.
select_profile() {

    local i=""

    for i in "${!GITHUB_PROFILES[@]}"; do
        IFS='|' read -r GH_LABEL GH_USER GH_EMAIL <<< "${GITHUB_PROFILES[$i]}"
        if [ "$1" == "$((i + 1))" ] || [ "$1" == "$GH_LABEL" ]; then
            return 0
        fi
    done

    return 1

}

choose_profile() {

    local i="" label="" user="" email=""
    local current="$(git config --file "$GITCONFIG_LOCAL" github.user 2> /dev/null)"

    for i in "${!GITHUB_PROFILES[@]}"; do
        IFS='|' read -r label user email <<< "${GITHUB_PROFILES[$i]}"
        printf "      %d) %-9s %-10s <%s>%s\n" $((i + 1)) "$label" "$user" "$email" \
            "$([ "$user" == "$current" ] && printf "  (current)")"
    done

    while true; do
        ask "Which GitHub account should this machine use? [1-${#GITHUB_PROFILES[@]}] "
        select_profile "$(get_answer)" && return 0
        print_error "Pick one of the numbers above"
    done

}

github_active_user() {
    gh api user --jq .login 2> /dev/null
}

authenticate_github() {

    if ! cmd_exists gh; then
        print_warning "gh is not installed, skipped GitHub auth."
        print_warning "Install gh (~/dotfiles/install-packages.sh), then re-run ~/dotfiles/install/github.sh"
        return 1
    fi

    # gh writes its credential helper with `git config --global`, which would
    # land in the tracked ~/.gitconfig symlink. Point it at the local file.
    export GIT_CONFIG_GLOBAL="$GITCONFIG_LOCAL"

    if [ "$(github_active_user)" != "$GH_USER" ]; then

        # Already logged in to this account at some point? Just switch.
        if ! gh auth switch --hostname github.com --user "$GH_USER" &> /dev/null; then
            print_warning "Logging in to GitHub. Make sure your browser is signed in as $GH_USER."
            gh auth login --hostname github.com --git-protocol https --web < /dev/tty
        fi

    fi

    local active="$(github_active_user)"

    if [ "$active" != "$GH_USER" ]; then
        print_error "gh is authenticated as '${active:-nobody}', expected '$GH_USER'."
        print_error "Run 'gh auth logout -u ${active:-<user>}' and re-run this script."
        unset GIT_CONFIG_GLOBAL
        return 1
    fi

    gh auth setup-git --hostname github.com
    print_result $? "gh authenticated as $GH_USER, git uses gh for github.com"

    unset GIT_CONFIG_GLOBAL

}

main() {

    print_in_purple "\n   GitHub Account\n   ------------------------------\n"

    if [ -n "$1" ]; then
        select_profile "$1" || { print_error "Unknown GitHub profile: $1"; return 1; }
    else
        choose_profile
    fi

    # Identity first, so commits are right even if auth below fails.
    git config --file "$GITCONFIG_LOCAL" user.name "$GIT_NAME" \
        && git config --file "$GITCONFIG_LOCAL" user.email "$GH_EMAIL" \
        && git config --file "$GITCONFIG_LOCAL" github.user "$GH_USER"
    print_result $? "Commits as $GIT_NAME <$GH_EMAIL> ($GITCONFIG_LOCAL)"

    authenticate_github

}

main "$@"
