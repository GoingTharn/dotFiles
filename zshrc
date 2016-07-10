ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

plugins=(git bundler brew gem history-substring-search colored-man-pages)

export PATH="/usr/local/bin:$PATH:$HOME/.powerline/scripts"

export EDITOR='vim'

DISABLE_UPDATE_PROMPT=true
source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [[ "$(uname -s)" == "Linux" ]]; then
  eval `dircolors ~/.dircolors`;
else
  export LSCOLORS='ExFxBxDxCxegedabagacad'
fi

bindkey -v # vi mode for shell
bindkey -e # enable C-x-e for shell editor
# key bindings for history search
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

setopt correct
setopt rmstarsilent # silence rm * confirmation

# Use 256 color for tmux.
alias tmux="TERM=screen-256color-bce tmux"

# Explicity bind home and end keys (in case of terminal compatibility issues)
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

if [[ -z "$TMUX" ]]; then
  export TERM="xterm-256color"
fi

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

