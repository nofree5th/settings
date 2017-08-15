#!/bin/sh

cd "$(dirname $0)"


CUR="$PWD"

sh $CUR/git_conf.sh

cd ~ && {
    ln -s $CUR/bashrc.sh .
    ln -s $CUR/vimrc.vim .vimrc
}

mkdir -p ~/bin && cd ~/bin && {
    ln -s $CUR/cppfmt.sh cppfmt
    ln -s $CUR/protofmt.sh protofmt
}
