##My vim settings.

###How to use:

```
cd ~
git clone git@github.com:ErnestWong/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
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
