# create a file in the lib directory and spec dir
lib () {
  if [[ $# -gt 0 ]]
    then
      mkdir -p lib
      touch lib/$1.rb
      mkdir -p spec/lib
      touch spec/lib/$1_spec.rb
      echo "** New Files **"
      ls lib/$1.rb
      ls spec/lib/$1_spec.rb
    else
      echo "Error: Missing new lib file name"
  fi
}

spec() {
  if [[ $# -gt 0 ]]
    then
  ruby -r fileutils -e "d = File.join('spec', File.dirname('$1'));FileUtils.mkdir_p d;f = File.join(d, File.basename('$1').split('.').first + '_spec.rb'); system('touch', f);puts 'New file: ' + f"
    else
      echo "Error: Missing new spec file name"
  fi
}

# make a dir and change into it, like a sane person
mcd () { mkdir -p $1; cd $1; }

# git super command
# make sure with zsh that the git plugin is not used
# as it will override this command
g () {
  if [[ $# -gt 0 ]]
    then
      git "$@"
    else
      git status
  fi
}

# makes remembering system links easier
lns () {
  if [ $# -eq 2 ]
    then
      ln -s "$@"
    else
      echo "lns [existing-path] [non-existent-path]"
  fi
}

# git local repo user
git_th78 () {
  git config user.name "Josh Mills"
  git config user.email "josh@trueheart78.com"
}

git_b () {
  git checkout -b $1 origin/$1
}

cmmrspec () {
  LOCAL_CMP=true TEST_ENV=$1 bundle exec rspec
}

cmmtest () {
  LOCAL_CMP=true TEST_ENV=$1 bundle exec cifter -g 8
}

cmmclean () {
  LOCAL_CMP=true TEST_ENV=$1 bundle exec cifter --clean
}

tmp_stats () {
  echo "/tmp on $1 node 1"
  ssh deployer@mit$1n1.cmmint.net "df -h /tmp"
  echo "-----------------------------------------------"
  echo "/tmp on $1 node 2"
  ssh deployer@mit$1n2.cmmint.net "df -h /tmp"
}

deploy_to_test () {
  APP_ID=$1 bundle exec cap deploy
}

my_home_dir () {
  local home=`echo $USER`
  local user=`user_dir`
  echo "/$user/$home"
}

user_dir () {
  if [ `uname` = "Darwin" ]
  then
    echo "Users"
  else
    echo "home"
  fi
}

vagrant_dir () {
  local user=`echo $USER`
  if [ $user = "vagrant" ]
  then
    echo "/vagrant/code"
  else
    local home=`my_home_dir`
    echo "$home/vagrant/code"
  fi
}

# tmux
tm () {
  local user=`echo $USER`
  if [ $user = "vagrant" ]
  then
    echo "Error: no tmux from vagrant"
  else
    if [[ $# -gt 0 ]]
    then
      echo "[$1] Starting new tmux session"
      tmux new -s $1;
    else
      local current_path=`pwd`
      local current_app=`basename "$current_path"`
      echo "[$current_app] Starting new tmux session"
      tmux new -s $current_app
    fi
  fi
}

# this tends to exist and it just points an ls call 
unalias a 2>/dev/null
a () {
  local vagrant_dir=`vagrant_dir`
  if [[ $# -gt 0 ]]
  then
    echo "Changed into $vagrant_dir/$1"
    cd "$vagrant_dir/$1"
  else
    echo "Changed into $vagrant_dir"
    cd "$vagrant_dir"
  fi
}

# easy tmux spinup
atm () {
  if [[ $# -gt 0 ]]
  then
    a $1
    tm $1
  else
    echo "Error: no project name passed"
  fi
}

# full list of vagrant repos
repo_list() {
  local vagrant_dir=`vagrant_dir`
  local repos=("$vagrant_dir/$2"*)
  [[ -e ${repos[0]} ]] && COMPREPLY=( "${repos[@]##*/}" )
}

complete -F repo_list a
complete -F repo_list tm
complete -F repo_list atm
