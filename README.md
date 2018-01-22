# My Dotfiles

Run `script/setup` to make the magic happen.

## The Magic aka Auto-Symlinking

For me, in `zsh`, this is what running `script/setup` looks like:

```sh
Checking /Users/jmills/.dotfiles: not there
Checking /Users/jmills/.gemrc: not there
Checking /Users/jmills/.gitignore_global: not there
Checking /Users/jmills/.gitconfig-include: not there
Checking /Users/jmills/.gitshrc: not there
Checking /Users/jmills/.irbrc: not there
Checking /Users/jmills/.pryrc: not there
Checking /Users/jmills/.tmux.conf: not there
Checking /Users/jmills/.vim: not there
Checking /Users/jmills/.vimrc: not there
Checking /Users/jmills/.vimrc.bundles: not there
Checking /Users/jmills/.oh-my-zsh/themes/th78.zsh-theme: not there
Linking /Users/jmills/.dotfiles: linked
Linking /Users/jmills/.gemrc: linked
Linking /Users/jmills/.gitignore_global: linked
Linking /Users/jmills/.gitconfig-include: linked
Linking /Users/jmills/.gitshrc: linked
Linking /Users/jmills/.irbrc: linked
Linking /Users/jmills/.pryrc: linked
Linking /Users/jmills/.tmux.conf: linked
Linking /Users/jmills/.vim: linked
Linking /Users/jmills/.vimrc: linked
Linking /Users/jmills/.vimrc.bundles: linked
Linking /Users/jmills/.oh-my-zsh/themes/th78.zsh-theme: linked
------------------------------------------------------------
source $HOME/.cache/zsh/config.sh
source $HOME/.cache/zsh/aliases.sh
source $HOME/.cache/zsh/functions.sh
source $HOME/.cache/shared/aliases.sh
source $HOME/.cache/shared/functions.sh
------------------------------------------------------------
Then reload your zsh shell with 'source /Users/jmills/.zshrc'
Note: vim requires the :PlugInstall command to be run.
```

## Adding New Dotfiles

Simply add a file or directory to the `files/` path, and then add it to the
`config.yml` file to setup the assignment map. For optional links, make sure
to set the `optional` flag to `true` for the link in question. Even post-creation
commands are now supported, using the optional `:command:` entry.

### Optional `command`

It can be any system command, and it currently supports the dynamic `LINK_PATH` that
gets created.

Example:

```sh
git config --global core.excludesfile LINK_PATH
```

## Vim Configuration

Please see the [Vim Customization](vim.md) file for details on the customization.
