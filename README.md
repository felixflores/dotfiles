# My Dotfiles

Run `script/setup` to make the magic happen.

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
