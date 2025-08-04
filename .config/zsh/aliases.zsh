alias ls='ls --color=auto'
alias la='ls -lahF'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

alias history='fc -li 100'

alias grep="grep -P -i --color=auto"

alias vim='nvim'
alias vi='nvim -u NONE'

alias gf='git fetch'
alias grb='git rebase'
alias gcp='git cherry-pick'
alias gl='git pull'
alias gp='git push'
alias gpf='git push --force-with-lease'

alias gst='git status -sb --ahead-behind'

alias gstl='git stash list'
alias gsta='git stash push'
alias gstas='git stash -- $(git diff --staged --name-only)'
alias gstp='git stash pop'
alias gstd='git stash drop'

alias gbr='git branch --remote'
alias gsw='git switch'
alias gco='git checkout'
alias gsh='git show'
alias gd='git diff'

alias glo='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias glod='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --all'
