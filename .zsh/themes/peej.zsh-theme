local return_code='%(?..%{$FG[009]%}%? ↵ %{$reset_color%})'
local git_branch='$(git_prompt_info)$(git_prompt_status)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[240]%}(%{$FG[034]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$FG[240]%})"
#ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[009]%}✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[034]%}✔ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[red]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%} ✹ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}➜ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}═ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}← "
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[red]%} ↑ "
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[red]%} ↓ "

PROMPT="

%{$FG[067]%}%/%{$reset_color%} ${git_branch}
%{$FG[071]%}%n@%M%{$reset_color%}%{$FG[131]%}-%{$FG[247]%}$ "

RPROMPT='$(vi_mode_prompt_info)'
