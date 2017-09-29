# Vim (see shared/aliases for more sweetness)
alias v\?="echo 'vza, vzf = zsh-based aliases and functions [va, vf]' && echo 'vsa, vsf = shared aliases and functions' && echo 'vva, vvf = vagrant-based aliases and functions'"
alias vsa="vim ~/.dotfiles/shared/aliases.sh"
alias vsf="vim ~/.dotfiles/shared/functions.sh"
alias vza="vim ~/.dotfiles/zsh/aliases.sh"
alias vzf="vim ~/.dotfiles/zsh/functions.sh"
alias va="vza"
alias vf="vzf"
alias vva="vim ~/.dotfiles/vagrant/aliases.sh"
alias vvf="vim ~/.dotfiles/vagrant/functions.sh"
alias vz="vim ~/.zshrc"
alias vzh="vh"

alias vh="vim ~/.zsh_history"
alias vv="vim ~/.vimrc"
alias vmr="vim ~/.vim/macros/ruby.vim"
alias vmm="vim ~/.vim/macros/markdown.vim"
alias vp="vim . -p"
alias vgem="vim Gemfile"
alias vb="vim ~/.vimrc.bundles"
alias vgig="vim ~/.gitignore_global"
alias vgin="vim ~/.gitconfig-include"
alias vga="vim ~/.gitconfig-include"
alias vgi="wh vgig && wh vgin && wh vga"
alias vt="vim ~/.tmux.conf"

# gifs
alias gifs="ruby -e \"puts `find ~/Dropbox/gifs -type f | wc -l`.to_s.strip.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse + ' gifs in ' + `find ~/Dropbox/gifs -type d | wc -l`.to_s.strip.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse + ' directories'\""
alias gif-count="gifs"

# self notes
alias vn='vim ~/Dropbox/covermymeds/self-notes-2017.md'
alias sn='vn'

#thefuck : https://github.com/nvbn/thefuck
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
alias o='fuck'

# Elixir
alias imix="iex -S mix"

# Elm
alias el="elm"
alias erb="elm repl"
alias ef="elm format"
alias et="elm test"
alias elv="elm live"

#zsh
alias rl=". ~/.zshrc && cd . && echo 'ZSH config reloaded and current dir refreshed'"

#tmux
alias newscreen="tmuc"

# Handle the fact that this file will be used with multiple OSs
platform=`uname`
if [[ $platform == 'Linux' ]]; then
  alias a='ls -lrth --color'
  alias nokogiri-fix='sudo apt-get install build-essential patch ruby-dev zlib1g-dev libsqlite3-dev'
  alias empty-trash='rm -rf ~/.local/share/Trash/*'
elif [[ $platform == 'Darwin' ]]; then
  alias a='ls -lrthG'
  alias vc='cd ~/vagrant/code/'
  alias cv='vc'
  alias vup='cd ~/vagrant/ && vagrant up'
  alias vss='cd ~/vagrant/ && vagrant up && vagrant ssh'
  alias vssh="echo 'Please use vss in the future' && vss"
  alias formcon="vagrant ssh -c 'cd /vagrant/code/forms-api && bundle exec rails console'"
  alias dns_cache_clear='sudo killall -HUP mDNSResponder'
  alias clear_dns='dns_cache_clear'

  alias htop='sudo htop'

  alias deploy-testing="APP_ID=master be cap testing deploy"
  alias deploy-integration="APP_ID=master be cap integration deploy"
  alias deploy-production="APP_ID=master be cap production deploy"

  alias log-integration="be cap integration log"
  alias log-production="be cap production log"
fi
