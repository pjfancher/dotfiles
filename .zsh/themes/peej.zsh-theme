local return_code='%(?..%{$FG[009]%}%? ↵ %{$reset_color%})'
local git_branch='$(git_prompt_info)$(git_prompt_status)'
local machine_color='$FG[065]'
local da='$BG[175]$FG[233]'

if [[ ${(%):-%M} = *datingadvice* ]]; then
    machine_color=$da
fi
 
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

PROMPT="

%{$FG[068]%}%//%{$reset_color%} ${git_branch}
%{$machine_color%}%n@%M%{$reset_color%}%{$FG[131]%}•%{$FG[245]%}$ %{$FG[249]%}"

RPROMPT=''

export LS_COLORS='no=38;05;245:fi=38;05;07:di=38;05;68:ln=38;05;06:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=38;05;10:mi=38;05;160'
