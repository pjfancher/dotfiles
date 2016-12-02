########################################
# VARS
########################################
local return_code='%(?..%{$FG[009]%}%? ↵ %{$reset_color%})'
local git_branch='$(git_prompt_info)$(git_prompt_status)'


########################################
# DEFINE SERVER COLORS
########################################
local server_color=''
local dev='$FG[065]'
local db='$BG[202]$FG[000]'
local da='$BG[175]$FG[233]'
local pr='$BG[237]$FG[206]'
local cd='$BG[018]$FG[245]'
local bc='$BG[064]$FG[255]'
local cr='$BG[060]$FG[253]'
local dc='$BG[172]$FG[000]'
local ha='$BG[130]$FG[255]'
local gvs='$BG[237]$FG[038]'



########################################
# SET SERVER COLORS
########################################
case ${(%):-%M} in
    *digitalbrands* ) server_color=$db;;
    *datingadvice* ) server_color=$da;;
    *printaholic* ) server_color=$pr;;
    *cd-master-web* ) server_color=$cd;;
    *badcredit* ) server_color=$bc;;
    *cardreviews* ) server_color=$cr;;
    *hostingadvice* ) server_color=$ha;;
    *dealcrunch* ) server_color=$dc;;
    *gainesvilleshows* ) server_color=$gvs;;
    *) server_color=$dev;;
esac


########################################
# GIT PROMPT 
########################################
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[245]%}→ %{$FG[028]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[009]%}✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[028]%}✔ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[009]%} ✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[009]%} ✹ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[009]%} ✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[009]%} ➜ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[011]%} ═ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[009]%} -- "
ZSH_THEME_GIT_PROMPT_AHEAD="%{$FG[009]%} ↑ "
ZSH_THEME_GIT_PROMPT_BEHIND="%{$FG[009]%} ↓ "


########################################
# PROMPT
########################################
PROMPT="

%{$FG[068]%}%//%{$reset_color%} ${git_branch}
%{$server_color%}%n@%M%{$reset_color%}%{$FG[131]%}•%{$FG[245]%}$ %{$FG[249]%}"

RPROMPT=''


########################################
# SHELL COLORS
########################################
export LS_COLORS='no=38;05;245:fi=38;05;07:di=38;05;68:ln=38;05;06:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=38;05;10:mi=38;05;160'
