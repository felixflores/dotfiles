# See shared/functions for more sweet tools

git-deploy () {
  if [[ -n "$1" ]] ; then
    current_branch="$(git rev-parse --abbrev-ref HEAD | xargs echo -n)"
    echo "Deploying '$current_branch' to $1:master"
    git push -f $1 $current_branch:master
  else
    echo "Error: No remote specified"
  fi
}

# vagrant crafting
vagserv () {
  cd ~/vagrant
  vagrant ssh -c "cd /vagrant/code/$1 && bundle exec rails console"
}

vbundle () {
  cd ~/vagrant
  vagrant ssh -c "cd /vagrant/code/$1 && bundle install"
}

vrake () {
  cd ~/vagrant
  vagrant ssh -c "cd /vagrant/code/$1 && rake $2"
}

vcd () {
  cd ~/vagrant/code/
  cd $1
}

vphpunit () {
  vagrant ssh -c "cd /vagrant/code/cmm_php && phpunit $1"
}

vkick () {
  vagrant ssh -c "sudo service httpd restart"
}

# docker commands

# elixir
dex (){
  eval "$(docker-machine env default)"
  if ! [ -t 0 ]; then # it's being piped into
    docker run -i --rm \
      -v "$PWD":/data \
      -w /data \
      elixir:latest elixir
  else
    docker run -it --rm \
      -v "$PWD":/data \
      -w /data \
      elixir:latest elixir $*
  fi
}

# iex - elixir shell
dix (){
  eval "$(docker-machine env default)"
  docker run -it --rm \
    -v "$PWD":/data \
    -w /data \
    elixir:latest iex
}

# mix - elixir lib stuff

# ruby
druby (){
  eval "$(docker-machine env default)"
  if ! [ -t 0 ]; then # it's being piped into
    docker run -i --rm \
      -v "$PWD":/data \
      -w /data \
      ruby:latest ruby
  else
    docker run -it --rm \
      -v "$PWD":/data \
      -w /data \
      ruby:latest ruby $*
  fi
}
# irb - ruby shell
dirb (){
  eval "$(docker-machine env default)"
  docker run -it --rm \
    -v "$PWD":/data \
    -w /data \
    ruby:latest irb
}
