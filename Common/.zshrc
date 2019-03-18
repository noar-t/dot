# Various exports 
export EDITOR=vim
export BROWSER=w3m

# History management
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# Dynamically write to history file
setopt INC_APPEND_HISTORY

# Dont write duplicates
setopt HIST_IGNORE_ALL_DUPS

# Shortcuts
alias l='ls -lFh'
alias lsa='ls -lah'
alias la='ls -lAFh'
alias ls='ls -G'

alias homebase='ssh nthornton@72.182.38.192 -p 60001'

alias tmux.conf='$EDITOR ~/.tmux.conf'
alias vimrc='$EDITOR ~/.vimrc'
alias zshrc='$EDITOR ~/.zshrc'

alias weather='curl -s wttr.in/Austin'
export ANTIGEN_HOME=$HOME/.antigen
export VIMPLUG_HOME=$HOME/.vim

if [[ ! -d $ANTIGEN_HOME ]]; then
  mkdir $ANTIGEN_HOME
  curl -L git.io/antigen > $ANTIGEN_HOME/antigen.zsh
fi

if [[ -d $HOME/.local/bin ]]; then
  export PATH=$HOME/.local/bin:$PATH
fi

# MacOS
if [[ $(uname -s) == Darwin ]]
then
  alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
  # Hombrew stuff
  export PATH="/usr/local/sbin:$PATH"

  # Set colors properly for iterm
  source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
fi

# Enable ZSH plugins
source $ANTIGEN_HOME/antigen.zsh

# oh my zsh plugins
antigen use oh-my-zsh
# makes man pages more readable
antigen bundle colored-man-pages
# oh my zsh git
#antigen bundle git

# syntax highlighting
antigen bundle "zsh-users/zsh-syntax-highlighting"

# autocompletion testing suggestion
antigen bundle "zsh-users/zsh-autosuggestions"

# more completions
antigen bundle "zsh-users/zsh-completions"

# zsh pure theme
antigen bundle "denysdovhan/spaceship-prompt"

# TESTING
# Alias reminders
antigen bundle 'djui/alias-tips'

antigen bundle 'Tarrasch/zsh-bd'


#export ANTIGEN_LOG=$HOME/.alog
export SPACESHIP_EXEC_TIME_SHOW=false
# black/dark grey with gruvbox
export SPACESHIP_DIR_COLOR=0

export SPACESHIP_BATTERY_SHOW=true
export SPACESHIP_BATTERY_THRESHOLD=10

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
