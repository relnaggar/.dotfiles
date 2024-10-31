# silence default shell zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# bash prompt
SC="\e["
CYAN="${SC}36m"
NC="\e[0m"
export PS1=">\$? \u@\h:${CYAN}\w${NC}\$ "

# iTerm window title
if [ ${ITERM_SESSION_ID} ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD}\007"; ':"${PROMPT_COMMAND}"
fi

# aliases
alias ls='ls -GAl'
alias python='python3'

