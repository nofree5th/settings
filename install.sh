#!/bin/sh

cd "$(dirname $0)"


CUR="$PWD"

sh $CUR/git_conf.sh

if [ x"$1" = xforce ];then
    OPTIONS="-f"
else
    OPTIONS=""
fi

# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install vim plug manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd ~ && {
    ln -s $OPTIONS $CUR/base.sh .base.sh
    ln -s $OPTIONS $CUR/bashrc.sh .
    ln -s $OPTIONS $CUR/bazelrc.sh .bazelrc.sh

    ln -s $OPTIONS $CUR/vimrc.vim .vimrc
    ln -s $OPTIONS $CUR/run_bazel.sh .run_bazel.sh
}

mkdir -p ~/bin && cd ~/bin && {
    ln -s $OPTIONS $CUR/cppfmt.sh cppfmt
    ln -s $OPTIONS $CUR/protofmt.sh protofmt
}
