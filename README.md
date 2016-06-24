# .vim

This repo consists of my vim dot files. 

## Installation

### Get .vimrc

```sh
$ cd ~/
$ mv .vim .vim.bkp # backup existing vim files
$ mv .vimrc .vimrc.bkp
$ git clone https://github.com/isubuz/.vim.git .vim
$ ln -sf ~/.vim/vimrc ~/.vimrc
```

### Install Vundle

The vim dot files using the [Vundle](https://github.com/VundleVim/Vundle.vim) plugin manager to download and install
the vim plugins. Install Vundle by running the following:

```sh
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Once Vundle is installed, open vim and run `:PluginInstall` to install all
plugins specified in `.vimrc`

## Command and keyboard shortcuts

### Ctags

- `Ctrl-]`        Jump to definition
- `Ctrl-t`        Jump back from definition
- `Ctrl-w }`      Preview definition
- `g]`            See all definitions
- `:tn`           Move to next definition (`:tnext`)
- `:tp`           Move to previous definition (`:tprev`)
- `:tf`           Move to first tag of the list (`:tfirst`)
- `:tl`           Move to last tag of the list (`:tlast`)
- `:ts`           List all definitions (`:tselect`)
- `:CtrlPTag`     With CtrlP plugin, search for a tag
