#!/bin/sh


CUR="$PWD"

cd ~ && {
    ln -s $CUR/bashrc.sh .
    ln -s $CUR/git_conf.sh .
    ln -s $CUR/vimrc.vim .vimrc
}

cd ~/bin && {
    ln -s $CUR/cppfmt.sh cppfmt
    ln -s $CUR/protofmt.sh protofmt
}
