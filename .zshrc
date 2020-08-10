#Path to the pur zsh
fpath=(
  "$HOME/.zfunctions"
  "$HOME/.zfunctions/pure"
  $fpath
)

autoload -U colors && colors
autoload -U compinit compdef && compinit
autoload -U promptinit && promptinit
autoload -U select-word-style && select-word-style bash
prompt pure

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
zstyle ':completion:*' menu select
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:match:*' original only
zstyle ':prompt:pure:git:dirty' color 'blue'

setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# Ensure that IntellJ doesn't use his own history file. See the source code
# of the terminal plugin of IntelliJ for more details:
# https://github.com/JetBrains/intellij-community/blob/master/plugins/terminal/resources/.zshrc
unset __INTELLIJ_COMMAND_HISTFILE__

export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export EDITOR="vim"
export HISTFILE="$HOME/.zsh_history"
export HISTFILESIZE=10000
export HISTSIZE=10000
export MANPAGER="most"
export PAGER="most"
export SAVEHIST=10000

eval "$(rbenv init -)"

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="$HOME/.symfony/bin:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

#eval "$(pyenv init -)"

alias j='fasd_cd -d'
alias la='ls -al'
alias ll='ls -lh'
alias ls='ls -FG'
alias rg="rg --smart-case --no-line-number"
eval "$(fasd --init auto)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
