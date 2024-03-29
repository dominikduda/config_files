# Path to your oh-my-zsh installation.
export ZSH=/home/dominikduda/.oh-my-zsh


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting alias-tips)
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="thedd"
# ZSH_THEME="agnoster"

# bindkey "^[[A" history-substring-search-up
# bindkey "^[[B" history-substring-search-down

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
# COMPLETION_WAITING_DOTS="false"

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

# User configuration

export PATH=$PATH:"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/bin/python3"
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

# Ignore ctrl+d (so I wont exit tmux panes accidentally)
set -o ignoreeof
# Do not append duplicates to .zsh_history
setopt    EXTENDED_HISTORY
setopt    HIST_IGNORE_ALL_DUPS
setopt    HIST_IGNORE_DUPS
setopt    HIST_NO_STORE
setopt    HIST_REDUCE_BLANKS
setopt    HIST_VERIFY

open() {
  xdg-open $1 &> /dev/null
}

# Fuzzy:
alias lsf="vim \$(ls -w 1 | fzf)"
alias cdf="cd \$(ls -w 1 | fzf)"
alias gcof="git checkout \$(git branch -a | fzf)"

alias gdf="git filteredDiff"
alias gds="git diff --staged"

alias v="nvim"
alias sv="sudo nvim"
alias vimrc="nvim ~/.vimrc"
alias r="ranger"

alias dc="docker-compose"

alias dcd="docker-compose -f docker-compose.yml"
alias de='docker exec -it catalyst_puma_1'
alias catalyst_clean_all="
  docker-compose down;
  docker volume prune --force;
  docker system prune -a --volumes --force;
  docker-compose down;
  docker volume prune --force;
  docker volume prune -f
  docker system prune -a --volumes --force;
"

alias catalyst_clean_generated="
  setopt rm_star_silent
  rm -rf ~/github/catalyst/public/generated/*
  setopt no_rm_star_silent
"

xset r rate 664 50



# alias cat_frontend="docker-compose down; docker-compose up; docker-compose logs -f"

# docker
alias dsh='docker exec -it $(  docker ps | fzf | awk '"'"'{print $1;}'"'"'  ) sh'
alias dbash='docker exec -it $(  docker ps | fzf | awk '"'"'{print $1;}'"'"'  ) bash'

alias ddbg='docker exec -it $(  docker ps | fzf | awk '"'"'{print $1;}'"'"'  ) dbg'


eenvf() { bin/env $(ls ~/.docker/machine/machines | sed -r 's/-/ / g' | sed -r 's/catalyst // g' | sort -V | fzf +s --tac;) }


alias cat_npm_log="npm start | tee /tmp/cat_npm.log"
alias cat_npm_grepped_log="tail -f /tmp/cat_npm.log | grep 'built'"

export IGNOREEOF=10

export EDITOR='nvim'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="/home/dominikduda/.rvm/gems/ruby-2.1.5/bin:/home/dominikduda/.rvm/gems/ruby-2.1.5@global/bin:/home/dominikduda/.rvm/rubies/ruby-2.1.5/bin:/home/dominikduda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/heroku/bin:/home/dominikduda/.local/bin:/home/dominikduda/.rvm/bin"

. $HOME/.asdf/asdf.sh

# Android studio requires
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="/home/dominikduda/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# This is necessary to make work git info on tmux-powerline
# PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "")'

# Override git branch segment from prompt with empty function to disable it
prompt_git() {}

# export FZF_DEFAULT_COMMAND='ag --hidden -g "" --ignore-dir .git --ignore-dir node_modules'

# export FZF_CTRL_R_OPTS="
#   --preview 'echo {}' --preview-window up:3:hidden:wrap
#   --bind 'ctrl-/:toggle-preview'
#   --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#   --color header:italic
#   --header 'Press CTRL-Y to copy command into clipboard'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
