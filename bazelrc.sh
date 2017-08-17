#! /bin/bash --

source ~/.base.sh

## -------------------- utils ------------------------------
base_g_last_src=""
base_g_last_bin=""
## Desc : change to the sources relative bazel-bin directory
## Usage: ChangeToBinaryDirectory
function ChangeToBinaryDirectory()
{
    local cur_path="$PWD"
    local bin_path="$HOME/src/zerone/bazel-bin/${cur_path/#*zerone\//}"
    if [ -d "$bin_path" ];then
        base_g_last_src="$cur_path"
        cd "$bin_path"
        base_g_last_bin="$PWD"
    elif [ -d "$base_g_last_bin" ];then
        cd "$base_g_last_bin"
    fi
}

## Desc : change to the bazel-bin relative source directory
## Usage: ChangeToSourceDirectory
function ChangeToSourceDirectory()
{
    local cur_path="$PWD"
    local src_path="${HOME}/zerone/${cur_path/#*zerone\/bazel-bin\//}"
    if [ -d "$src_path" ];then
        base_g_last_bin="$cur_path"
        cd "$src_path"
        base_g_last_src="$PWD"
    elif [ -d "$base_g_last_src" ];then
        cd "$base_g_last_src"
    fi
}

function changeUsage()
{
    local prefix='| '
    echo "-----------------------------------"
    echo "$prefix  [WELCOME TO QUICK CHANGE DIRECTORY TOOLS] "
    echo "$prefix  0. ${COLOR_GREEN}dir_pattern${COLOR_RESET} (guess mode)"
    echo "$prefix  1. ${COLOR_GREEN}NUMBER${COLOR_RESET} (select mode)"
    echo -e "$prefix  \teg. ${COLOR_YELLO}2${COLOR_RESET}: select the number 2 directory of the list"
    echo "$prefix  2. ${COLOR_GREEN}ctrl + c${COLOR_RESET} : exit me"
    echo "-----------------------------------"
    echo -n "(no input means show this) Press <Enter> to continue ..."
    read dummy
}

function numberDirectory()
{
    if [ $# -eq 0 ];then
        return 1
    fi
    local number=0
    for dir in $(echo "$@" | tr '\n' ' ');do
        number=`expr $number + 1`
        echo "${COLOR_CYAN}${number}${COLOR_RESET}. $dir"
    done
}
function getNumberOfDirectory()
{
    if [ $# -eq 0 ];then
        return 1
    fi
    local matchNumber=$1
    shift
    local number=0
    for dir in $(echo "$@" | tr '\n' ' ');do
        number=`expr $number + 1`
        if [ $number -eq $matchNumber ];then
            echo $dir
            return 0
        fi
    done
}
## Desc : change to the source directory like xxx
## Usage: ChangeToDirectoryLike key
function ChangeToDirectoryLike()
{
    local key="$1"
    local dirs="$(find ~/src -maxdepth 3 -mindepth 1 -type d)"
    dirs="$(echo "$dirs"|egrep -v '\.')"
    local errmsg=""
    local dir=""
    while true
    do
        while [ "$key" = "" ]
        do
            numberDirectory "$dirs"
            rmsg_ "$errmsg"
            ymsg_ "Enter key to filter > "
            read key
            if [ "$key" = "" ];then
                changeUsage
            fi
        done

        # check is special cmd
        local is_quit=0
        case "$key" in
            \?)
                changeUsage
                key=""
                ;;
            .)
                is_quit=1
                key=""
                ;;
        esac
        if [ $is_quit -ne 0 ];then
            cmsg "Bye, enjoy your life!"
            break
        elif [ "$key" = "" ];then
            continue
        fi

        # check is number
        echo "$key" | egrep -q '^[0-9]+$'
        if [ $? -eq 0 ];then
            # select by number
            dir="$(getNumberOfDirectory "$key" $dirs)"
        else
            # filter by words
            dir=$(echo "$dirs"|egrep "$key")
        fi
        key=""
        local lines=$(echo "$dir"|wc -l)
        if [ $lines -eq 0 -o "$dir" = "" ];then
            errmsg="Match nothing, "
            continue
        fi
        if [ $lines -eq 1 ];then
            echo "Will change to [${COLOR_GREEN}${dir}${COLOR_RESET}]"
            cd "$dir"
            break
        fi
        dirs="$dir"
    done
}

function qu()
{
}
## -----------------end utils ------------------------------

# jump dir
alias cds='cd ~/src'
alias cdr='cd ~/src/zerone'

# tools
alias bb='bazel build'
alias cb=ChangeToBinaryDirectory
alias s=ChangeToSourceDirectory
alias c=ChangeToDirectoryLike
