COMPLETION_WAITING_DOTS=true
DISABLE_AUTO_UPDATE=true
HYPHEN_INSENSITIVE=true

unsetopt nomatch
unsetopt flowcontrol

setopt APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt INTERACTIVE_COMMENTS

typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red' 'trash' 'underline,fg=red')

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:git-checkout:*' sort false

DOTFILES_PATH=$HOME/dotfiles
ZSH_CUSTOM=$DOTFILES_PATH/zsh-custom
ZSH_THEME="parbs"


plugins=(
    git
    brew
    macos
    python
    rust
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $DOTFILES_PATH/.oh-my-zsh/oh-my-zsh.sh
source $ZSH_CUSTOM/zshrc-loaded

PATH="/bin"
path+=($HOME/.yarn/bin)
path+=($HOME/.cargo/bin)
path+=($HOME/go/bin)
path+=(/usr/local/bin)
path+=(/usr/local/opt)
path+=(/usr/local/share/npm/bin)
path+=(/usr/local/git/bin)
path+=(/usr/local/bin)
path+=(/usr/bin)
path+=(/bin)
path+=(/usr/local/sbin)
path+=(/usr/sbin)
path+=(/sbin)
path+=($PYENV_ROOT/bin)

export PATH

source $HOME/.profile

# PyEnv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi


source $HOME/.cargo/env

eval $(thefuck --alias)

eval "$(direnv hook zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


eval "$(zoxide init zsh)"

eval "$(oh-my-posh init zsh --config $DOTFILES_PATH/.tauvin.omp.json)"
