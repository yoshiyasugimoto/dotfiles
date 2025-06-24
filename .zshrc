# Zsh Configuration

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Completion
autoload -Uz compinit
compinit

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'
setopt PROMPT_SUBST

# Short directory display (last 2 dirs)
PROMPT='%F{cyan}%1~%f %F{red}${vcs_info_msg_0_}%f $ '

# Aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Docker aliases
alias d='docker'
alias dc='docker compose'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcb='docker compose build'
alias dcr='docker compose restart'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dlog='docker logs'
alias dlogf='docker logs -f'

# Git aliases
alias g='git'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gcam='git commit -am'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias glo='git log --oneline'
alias glg='git log --graph --oneline --all'
alias gp='git push'
alias gph='git push -u origin HEAD'
alias gpu='git push -u origin'
alias gpl='git pull'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'
alias gr='git reset'
alias grh='git reset --hard'
alias gst='git stash'
alias gstp='git stash pop'

# Environment variables
export EDITOR=vim
export LANG=en_US.UTF-8

# fzf + ghq integration (Ctrl-G)
function fzf-ghq() {
  local selected_dir=$(ghq list | fzf --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd $(ghq root)/${selected_dir}"
    zle accept-line
  fi
}
zle -N fzf-ghq
bindkey '^g' fzf-ghq

# fzf history search (Ctrl-R))
incremental_search_history() {
  selected=`history -E 1 | fzf | cut -b 26-`
  BUFFER=`[ ${#selected} -gt 0 ] && echo $selected || echo $BUFFER`
  CURSOR=${#BUFFER}
  zle redisplay
}
zle -N incremental_search_history
bindkey "^R" incremental_search_history