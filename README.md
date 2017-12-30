# Dotfiles
My config files for linux command line applications.
Inspired by [Toban's dotfiles](https://github.com/tobanw/dotfiles) 
and managed with [`dotbot`](https://github.com/anishathalye/dotbot).

###  Installation
```
git clone https://github.com/mattcbowers/dotfiles && cd dotfiles && ./install
```

### Basic upkeep
The dotfiles live in the `dotfiles` directory which can live anywhere locally.
The dotfiles themselves are linked into place by 
[`dotbot`](https://github.com/anishathalye/dotbot). 
Move new dotfiles to the `dotfiles` directory, then edit `install.yaml.conf` to specify where each file should be symlinked to.
Finally, execute the install script: `./install`.

#### Editing dotfiles
Since the actual dotfiles like `~/.bashrc` are symlinked to those in the 
`dotfiles` repo, edits to either will affect both.
You'll need to commit and push to save changes.

### Local configurations
Sometimes you want to overide the universal configurations locally without 
changing the universal dotfiles.
To do this, add code at the end of your main dotfiles to call a local 
counterpart which can overide the main configuration.
For example, I put machine-specific bash configurations in `.bashrc_local` 
and place the following at the end of `.bashrc`.
```
if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi
```

### Submodules

As explained in the awesome [blog post](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/), 
you can pull in other repos as 
git submodules to automate your dependency management.
For example to install the vim plugin 
[`tabular`](https://github.com/godlygeek/tabular) 
via [`pathogen`](https://github.com/tpope/vim-pathogen),
```
cd ~/.dotfiles/vim/bundle
git submodule add git://github.com/godlygeek/tabular.git
```
I do this with vim plugins and with dotbot itself.
To update submodules to their latest published version, run 
```
git submodule update --remote
```

