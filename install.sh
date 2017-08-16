#!/bin/sh

cd "$(dirname $0)"


CUR="$PWD"

sh $CUR/git_conf.sh

if [ x"$1" = xforce ];then
    OPTIONS="-f"
else
    OPTIONS=""
fi

cd ~ && {
    ln -s $OPTIONS $CUR/base.sh .base.sh
    ln -s $OPTIONS $CUR/bashrc.sh .
    ln -s $OPTIONS $CUR/bazelrc.sh .bazelrc.sh

    ln -s $OPTIONS $CUR/vimrc.vim .vimrc
}

mkdir -p ~/bin && cd ~/bin && {
    ln -s $OPTIONS $CUR/cppfmt.sh cppfmt
    ln -s $OPTIONS $CUR/protofmt.sh protofmt
}
