########################################
# VARS
########################################
local return_code='%(?..%{$FG[009]%}%? ↵ %{$reset_color%})'
local git_branch='$(git_prompt_info)$(git_prompt_status)'


########################################
# DEFINE SERVER COLORS
# https://jonasjacek.github.io/colors/
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
local dn='$BG[197]$FG[235]'
local hr='$BG[015]$FG[021]'
local mt='$BG[035]$FG[016]'
local dr='$BG[015]$FG[039]'
local fof='$BG[024]$FG[015]'


########################################
# SET SERVER COLORS
########################################
case ${(%):-%M} in
    *digitalbrands* ) server_color=$db;;
    *datingadvice* ) server_color=$da;;
    *printaholic* ) server_color=$pr;;
    *cd-master-web* ) server_color=$cd;;
    *badcredit* ) server_color=$bc;;
    *cardrates* ) server_color=$cr;;
    *hostingadvice* ) server_color=$ha;;
    *dealcrunch* ) server_color=$dc;;
    *gainesvilleshows* ) server_color=$gvs;;
    *datingnews* ) server_color=$dn;;
    *hostingreport* ) server_color=$hr;;
    *moneytrends* ) server_color=$mt;;
    *fourOhFour* ) server_color=$fof;;
    *the-drizzle* ) server_color=$dr;;
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
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[009]%} ●"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[009]%} ✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[009]%} ➜ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[011]%} ═ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[009]%} -- "
ZSH_THEME_GIT_PROMPT_AHEAD="%{$FG[009]%} ↑ "
ZSH_THEME_GIT_PROMPT_BEHIND="%{$FG[009]%} ↓ "


########################################
# MODE INDICATOR
########################################
MODE_INDICATOR="%{$BG[011]%}%{$FG[000]%} [VIM] %{$reset_color%}"


########################################
# PROMPT
########################################
PROMPT="

%{$FG[068]%}%//%{$reset_color%} ${git_branch}
%{$server_color%}%n@%M%{$reset_color%}%{$FG[131]%}•%{$FG[245]%}$ %{$FG[249]%}"

RPROMPT='$(vi_mode_prompt_info)'


########################################
# SHELL COLORS
########################################
export LS_COLORS='no=38;05;245:fi=38;05;07:di=38;05;68:ln=38;05;06:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=38;05;10:mi=38;05;160:*.lock=01;00;41'


########################################
# ZSH SYNTAX HIGHLIGHTING
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
########################################
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=241'
ZSH_HIGHLIGHT_STYLES[alias]='fg=194'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=194'
ZSH_HIGHLIGHT_STYLES[command]='fg=194'
#ZSH_HIGHLIGHT_STYLES[alias]='none'
#ZSH_HIGHLIGHT_STYLES[builtin]='none'
#ZSH_HIGHLIGHT_STYLES[command]='none'

ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=229'
ZSH_HIGHLIGHT_STYLES[path]='fg=68'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=68'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=68'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=175'

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=229'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=229'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=229'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=229'
