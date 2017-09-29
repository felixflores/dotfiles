# See shared/aliases for more sweet features

alias a='ls -lrth --color'
alias nokogiri-fix='sudo apt-get install build-essential patch ruby-dev zlib1g-dev libsqlite3-dev'

# Vim (see shared/aliases for more)
alias vz="vim ~/.bashrc"
alias vb="vz"
alias vzh="echo 'Use vh'"
alias vh="vim ~/.bash_history"
alias vv="vim ~/.vimrc"
alias vsa="vim ~/.dotfiles/shared/aliases.sh"
alias vsf="vim ~/.dotfiles/shared/functions.sh"
alias va="vva"
alias vf="vvf"
alias vva="vim ~/.dotfiles/vagrant/aliases.sh"
alias vvf="vim ~/.dotfiles/vagrant/functions.sh"
alias vp="vim . -p"
alias vgem="vim Gemfile"
alias vb="vim ~/.vimrc.bundles"
alias vgig="vim ~/.gitignore_global"
alias vgin="vim ~/.gitconfig-include"
alias vga="vim ~/.gitconfig-include"
alias vgi="wh vgig && wh vgin && wh vga"

# zsh
alias rl=". ~/.bashrc && cd . && echo 'Bash config reloaded and current dir refreshed'"
alias ll="ls -lh"
alias l="ll"
alias lsa="ls -lah"

# passenger
alias restart-rails-app="sudo passenger-config restart-app"
alias restart-all-rails-apps="sudo passenger-config restart-app /"
