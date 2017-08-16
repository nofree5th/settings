#! /bin/bash --

## -------------------- colourful print --------------------
## ANSI Foreground color codes:
## 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white 39=default
## ANSI Background color codes:
## 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white 49=default
COLOR_RED=$(    echo -e "\e[31;1m" )
COLOR_GREEN=$(  echo -e "\e[32;1m" )
COLOR_YELLO=$( echo -e "\e[33;1m" )
COLOR_BLUE=$(   echo -e "\e[34;1m" )
COLOR_MAGENTA=$(echo -e "\e[35;1m" )
COLOR_CYAN=$(   echo -e "\e[36;1m" )
COLOR_RESET=$(  echo -e "\e[0m"     )

rmsg() { echo "${COLOR_RED}$*${COLOR_RESET}";     }
gmsg() { echo "${COLOR_GREEN}$*${COLOR_RESET}";   }
ymsg() { echo "${COLOR_YELLO}$*${COLOR_RESET}";   }
bmsg() { echo "${COLOR_BLUE}$*${COLOR_RESET}";    }
mmsg() { echo "${COLOR_MAGENTA}$*${COLOR_RESET}"; }
cmsg() { echo "${COLOR_CYAN}$*${COLOR_RESET}";    }

rmsg_() { rmsg "$@" | tr -d '\n'; }
gmsg_() { gmsg "$@" | tr -d '\n'; }
ymsg_() { ymsg "$@" | tr -d '\n'; }
bmsg_() { bmsg "$@" | tr -d '\n'; }
mmsg_() { mmsg "$@" | tr -d '\n'; }
cmsg_() { cmsg "$@" | tr -d '\n'; }
## -----------------end colourful print --------------------
