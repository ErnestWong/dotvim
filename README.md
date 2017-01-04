##My vim settings.

###How to use (copy):
1. Copy all dot files to appropriate location in machine.
```
cp vimrc ~/.vimrc
cp .bash_profile ~/.bash_profile
cp .bashrc ~/.bashrc
cp tmux.conf ~/.tmux.conf
```
2. To install vim plugins, set up [Vundle](https://github.com/VundleVim/Vundle.vim).
  
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
3. Open ``~/.vimrc`` and type ``:PluginInstall``.

###How to use (link):

```
cd ~
git clone git@github.com:ErnestWong/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/tmux.conf ~/.tmux.conf
cd ~/.vim
git submodule init
git submodule update
```

###How to get YouCompleteMe set up

1. ``brew install cmake`` if cmake not installed
2. create folder where build files will be placed:
    ```
    cd ~ && mkdir ycm_build && cd ycm_build

    ```
3. Run cmake (no C/C++ support):
    ``` cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp```
4. Run:
    ```make ycm_support_libs```

For reference, read https://github.com/Valloric/YouCompleteMe



###How to make tab completion case insensitive

1. Add the following lines to ``~/.inputrc``:
```
# Ignore case while completing
set completion-ignore-case on
```
