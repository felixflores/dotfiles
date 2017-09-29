# enable control-s and control-q
stty start undef
stty stop undef
setopt noflowcontrol

# add ssh keys
ssh-add -L &> /dev/null
if [ $? -eq 1 ]; then
  ssh-add
fi 

# thefuck plugin
eval "$(thefuck --alias)"

# chruby requirement
source /usr/local/share/chruby/chruby.sh
# chruby auto-select for ruby version
source /usr/local/share/chruby/auto.sh