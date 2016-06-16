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
