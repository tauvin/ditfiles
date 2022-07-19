export LDFLAGS="-L/opt/homebrew/lib"
export CPPFLAGS="-I/opt/homebrew/include"

export CARGOPATH="$HOME/.cargo"

export DOCKER_SCAN_SUGGEST=false

export EDITOR="vim";


export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_COMPLETION_TRIGGER=',,'
export FZF_DEFAULT_COMMAND='ag -l --nocolor --hidden -g ""'
export FZF_DEFAULT_OPTS="--height=90% --info=inline --border --margin=1 --padding=1 --prompt='▶ ' --pointer=' →' --marker='→ ' --cycle --layout=reverse --query="$1" --select-1 --no-multi"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#cbccc6,bg:#1f2430,hl:#707a8c
 --color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66
 --color=info:#73d0ff,prompt:#707a8c,pointer:#cbccc6
 --color=marker:#73d0ff,spinner:#73d0ff,header:#d4bfff'


export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;


export HOMEBREW_BAT=1
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_DISPLAY_INSTALL_TIMES=1
export HOMEBREW_INSTALL_BADGE=" 🎉️"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";


export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_SHELL=zsh
