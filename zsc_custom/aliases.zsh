#########################################
# Replace commands                      #
#########################################
alias ls='exa -lhHb --icons -F --group-directories-first'
alias ll="ls -ah"
alias tree="exa --tree"
alias cat='bat'
alias grep='rg'
alias find='fd'
alias cd='z'

#########################################
# ZSH commands                          #
#########################################
alias zshconfig="code ~/.zshrc"
alias zshsrc="source ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

eval $(thefuck --alias)


#########################################
# Editing                               #
#########################################
alias e="$EDITOR ."
alias codeo="code --reuse-window"

#########################################
# Utils                                 #
#########################################
alias fixpsql="brew services stop postgresql && rm -f /opt/homebrew/var/postgres/postmaster.pid && brew services start postgresql"
