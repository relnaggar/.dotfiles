#!/bin/bash
set -euo pipefail
IFS=$'\n\t' 

if [[ ! -d ~/.vim ]]; then
  mkdir ~/.vim
fi
if [[ ! -d ~/.vim/colors ]]; then
  mkdir ~/.vim/colors
fi
curl -o ~/.vim/colors/badwolf.vim \
  https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim

