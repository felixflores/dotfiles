# Sizes in mb for current dir
alias sizes="du -sm * | sort -nr | more"

# Bundler

## Default Gems
alias install-gem-defaults-cmm="gem install bundler:1.10.6 && gem-defaults-extra"
alias install-gem-defaults-personal="gem install bundler && gem-defaults-extra"
alias gem-defaults-extra="gem install pry pry-doc interactive_editor rake byebug rubocop bundler-audit rake"

## Super Frequent
alias s="be rspec --no-profile"
alias sd="be rspec --format documentation --no-profile"
alias sf="be rspec --format documentation --fail-fast --no-profile"
alias r="be rails"
alias rr="be rake routes"
alias rs="be rails server -p 3000"
alias rc="be rails console"
alias b="bundle"
alias be="bundle exec"
alias rb="ruby"

## Time Saving Standard
alias bm="be brakeman"
alias bdbr="be rake db:migrate:reset"
alias bdbm="be rake db:migrate"
alias bdbs="be rake db:seed"
alias bake="be rake"
alias bcuke="be cucumber"
alias bcop="be rubocop --display-cop-names"
alias brub="be rubocop --display-cop-names"
alias bcopfx="be rubocop --display-cop-names --auto-correct"
alias bcopfix="be rubocop --display-cop-names --auto-correct"
alias brspec="be rspec"
alias baker="be rake routes"
alias brake="be rake"
alias broutes="be rake routes"
alias brails="be rails"
alias bert="be rake test"
alias bt="be rake test"
alias bts="be rake spec"
alias brb="be ruby"
alias berg="be rails generate"
alias bergs="be rails g scaffold"
alias brg="berg"
alias bewp="bundle install --without production"
alias boop="bewp"
alias bop="bundle install --without production"
alias bs1="be rails server -p 3001"
alias bs2="be rails server -p 3002"
alias bs="be rails server"
alias br="be rails"
alias bshotgun="be shotgun"
alias bshot="be shotgun"
alias bsh="be shotgun"
alias berc="be rails console"
alias brc="berc"
alias bguard="be guard"
alias bug="be guard"
alias beg="be guard"
alias bag="echo 'Run beg' && beg"
alias ber="be ruby"
alias bruby="be ruby"
alias bu="bundle update"
alias bc="bundle clean"
alias bundler-audit="bundle-audit"
alias ba="bundle-audit"
alias gi="gem install"
alias dbrollback="bundle exec rake db:rollback && bundle exec rake db:rollback RAILS_ENV=test"
alias dbcreate="bundle exec rake db:migrate && bundle exec rake db:migrate RAILS_ENV=test"
alias dbmigrate="dbcreate && bundle exec rake db:migrate && bundle exec rake db:migrate RAILS_ENV=test"

# Git
alias gut="git"
alias gsh="gitsh"
alias ga="git add"
alias gaa="git add -A"
alias gaf="git add -f"
alias gss="git status"
alias gd="git diff"
alias gf="git fetch"
alias gk="gitk"
alias gba="git branch -a"
alias gin="git init"
alias gst="git stash"
alias gstl="git stash list"
alias gsl="git stash list"
alias gstp="git stash pop"
alias gsp="git stash pop"
alias gl="git log"
alias gpom="git push origin master"
alias gpm="git push origin master"
alias gp="ruby -e 'if \`git rev-parse --abbrev-ref HEAD\`.chomp == :master.to_s; print \"You are on **MASTER**. Seriously, though. Do you honestly want push to **MASTER**? (Y/N) \"; unless gets.chomp.downcase == :y.to_s; puts \"♥ Push-to-Master crisis averted ♥\"; exit 1;end;end' && git push"
# alias git-clear-branches="ruby -e '`git branch`.chomp.split(\"\n\").reject { |x| x.include? \" master\" }.each { |b| `git branch -D #{b}`; puts \"#{b} branch deleted\" }'"
alias gpf="git push --force"
alias gpl="git pull"
alias gpp="git pull && git push"
alias gpu="git push -u"
alias gpr="git pull --rebase"
alias goo="gpp"
alias good="gpp && date"
alias gam="git commit -am"
alias gm="git commit -m"
alias gc="git commit -m"
alias gcv="git commit"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcof="git checkout -f"
alias gcom="git checkout master"
alias gcm="gm"
alias git-undo="git reset --soft HEAD~1"
alias git-rollback="git reset --soft HEAD~1"
alias git-unstage="git reset"
alias ci="git commit -v"
alias cia="git commit -av"
alias co="git checkout"
alias cob="git checkout -b"
alias cof="git checkout -f"
alias gcv="git commit -v"
alias gmg="git merge"
alias gwip="git add -A && git commit -m 'WIP' && git push"
alias gri="git fetch && git rebase -i origin/master"
alias gb="git branch"
alias gbl="git blame"
alias gctag="ctags --tag-relative -Rf.git/tags --exclude=.git --languages=-javascript,sql"
alias gctags="gctag"
alias deploy-heroku="git-deploy heroku"

#vim
alias vo="vim -O"
alias v="vim"
alias vi="vim"

#exit
alias exut="exit"
alias exi="exit"
alias eit="exit"
alias ex="exit"
alias e="exit"
alias q="exit"
alias :q="exit"

#ngrok
alias ngk="ngrok"
alias ngrk="ngrok"
alias ng="echo ' ngs: sinatra (ngrok http 4567)\n ngr: rails (ngrok http 3000)\nngsh: shotgun (ngrok http 9393)'"
alias ngr="ngrok http 3000"
alias ngs="ngrok http 4567"
alias ngsh="ngrok http 9393"
alias ng-rails="ngr"
alias ng-sinatra="ngs"

#shell config
alias reload="rl && tmrl && echo 'Short command is [rl]'"
alias rk="rl"
alias tmrl="tmux source-file ~/.tmux.conf"
alias hl="history 200 | awk '{a[\$2]++}END{for(i in a){print a[i] \" \" i}}' | sort -rn | head"
alias vhl="awk '/Command Line History/{p=1}/^ *$/{p=0}p' ~/.viminfo | awk '{a[\$1]++}END{for(i in a){print a[i] \" \" i}}' | sort -rn | head"

# Misc
alias suu="sudo apt-get update && sudo apt-get upgrade"
alias sap="sudo apt-get"
alias sapi="sudo apt-get install"
alias sapr="sudo apt-get remove"
alias js="jekyll serve"
alias h="head"
alias c="chruby"
alias ch="chruby"
alias ss="spring stop"
alias u="cd .."
alias uu="u && u"
alias uuu="u && u && u"
alias uuuu="u && u && u && u"
alias u2="uu"
alias u3="uuu"
alias u4="uuuu"
alias ur="cd ."
alias ru="cd ."
alias st="strace"
alias wh="which"
alias mdkir="mkdir"
alias mk="mkdir"
alias mkp="mkdir -p"
alias t="touch"
alias tr="tree"
alias clr="clear"
alias cls="clear"
alias tn="tm" # custom tm method defined in functions file
alias umt="sudo umount"
alias dus="du -sch"
alias post-to-url="curl -X POST"
alias shared-aliases-working="echo 'Yes, the shared aliases are working :)'"