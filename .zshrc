# Path to your oh-my-zsh installation.
  export ZSH=/home/klemen/.oh-my-zsh
LANG=en_US.utf8
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="illizian"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git shrink-path nvm)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/java/bin:/opt/java/db/bin:/opt/java/jre/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/klemen/.vimpkg/bin:/home/klemen/.vimpkg/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function swap()         
{
	local TMPFILE=tmp.$$
	mv "$1" $TMPFILE
	mv "$2" "$1"
	mv $TMPFILE "$2"
}

archey


export NVM_DIR="/home/klemen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Keypad
# # 0 . Enter
 bindkey -s "^[Op" "0"
 bindkey -s "^[Ol" "."
 bindkey -s "^[OM" "^M"
# # 1 2 3
 bindkey -s "^[Oq" "1"
 bindkey -s "^[Or" "2"
 bindkey -s "^[Os" "3"
# # 4 5 6
 bindkey -s "^[Ot" "4"
 bindkey -s "^[Ou" "5"
 bindkey -s "^[Ov" "6"
# # 7 8 9
 bindkey -s "^[Ow" "7"
 bindkey -s "^[Ox" "8"
 bindkey -s "^[Oy" "9"
# # + -  * /
 bindkey -s "^[Ok" "+"
 bindkey -s "^[Om" "-"
 bindkey -s "^[Oj" "*"
 bindkey -s "^[Oo" "/"


 alias whysoslow='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'
 alias fresh='clear && archey'
 
 export TERM=xterm-256color
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
alias config='/usr/bin/git --git-dir=/home/klemen/.cfg/ --work-tree=/home/klemen'
