# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source "$ZSH/oh-my-zsh.sh"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

plugins=(zsh-autosuggestions zsh-syntax-highlighting autojump)

# alias
alias c='clear'
alias e='exit'
alias o='open'
alias od='open .'
alias mvall='mv `find . -name "*.mp4"`'
alias ic='imgcat'

## vim/zsh/tmux
alias v='vim'

alias vv='vim ~/.vimrc'
alias vz='vim ~/.zshrc'
alias vt='vim ~/.tmux.conf'

alias sv='source ~/.vimc'
alias sz='source ~/.zshrc'
alias st='source ~/.tmux.conf'

alias v2v='vim -O2'
alias v3v='vim -O3'
alias v2h='vim -o2'
alias v3h='vim -o3'

tmux_init3h()
{
    tmux new-session -s "auto" -d -n "auto"
    tmux split-window -h
    tmux split-window -h
    tmux select-layout even-horizontal
    tmux select-pane -L
    tmux select-pane -L
    tmux -2 attach-session -d
}

tmux_init3v()
{
    tmux new-session -s "auto" -d -n "auto"
    tmux split-window -v
    tmux split-window -v
    tmux select-layout even-vertical
    tmux select-pane -L
    tmux select-pane -L
    tmux -2 attach-session -d
}

tmux_init2v()
{
    tmux new-session -s "auto" -d -n "auto"
    tmux split-window -v
    tmux select-layout even-vertical
    tmux -2 attach-session -d
}

tmux_init2h()
{
    tmux new-session -s "auto" -d -n "auto"
    tmux split-window -h
    tmux select-layout even-horizontal
    tmux -2 attach-session -d
}

alias t3h='tmux_init3h'
alias t2h='tmux_init2h'
alias t3v='tmux_init3v'
alias t2v='tmux_init2v'

## enhenced
alias ps='procs'
alias cut='choose'
alias cr='mcfly'
alias diff='diff-so-fancy'
alias rg='ripgrep'
alias hx='hexyl'
alias br='broot'
alias z='zoxide'

## pc4
alias pc4='proxychains4'
alias pc4='proxychains4'
alias pbi='proxychains4 brew install'
alias pbu='proxychains4 brew uninstall'
alias pci='proxychains4 brew install --cask'
alias dl='proxychains4 wget'
alias pgc='proxychains4 git clone'

## pxy
alias setpxy="export ALL_PROXY=socks5://127.0.0.1:7891"
alias unpxy="unset ALL_PROXY"



## brew
alias bu='brew update ; brew upgrade'
alias bi='brew install'
alias bun='brew uninstall'
alias buc='brew uninstall --cask'
alias bic='brew install --cask'
alias bcl='brew clean'
alias pbu='pc4 brew update ; pc4 brew upgrade'



## git
alias vr='vim README.md'
alias cl='git clone'
alias co='git commit -m'
alias ga='git add .'
alias gcm='git commit -m "Update README.md"'
alias glg='git lg'
alias gd='git diff'

alias first='git-first'
alias next='git-next'
alias prev='git-prev'
alias last='git-last'

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"



## other
function mkdircd(){
    mkdir -p "$@" && eval cd "\"\$$#\"";
}

alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '

function delDS_Store()
{
    name='.DS_Store'
    if [ -f "$name" ]
    then
        rm $name
    fi
}

function lshow()
{
    dir='./.git'
    if [ -d "$dir" ]
    then
        echo -e "\033[34m==============================================================================\033[0m"
        echo "      \033[34mThis directory contains .git, please git pull first before ggpush.\033[0m"
        echo -e "\033[34m==============================================================================\033[0m"
        echo ""

        ls -alh
        delDS_Store
        
        echo ""
        echo -e "\033[34m==============================================================================\033[0m"
        echo "      \033[34mThis directory contains .git, please git pull first before ggpush.\033[0m"
        echo -e "\033[34m==============================================================================\033[0m"
    else
        ls -alh
        delDS_Store
    fi

}

alias ll='foo(){ lshow }; foo '
alias l='ls -lh'


## adb/fastboot
alias ai='adb install'
alias ffr='fastboot flash recovery'
alias ad='adb devices'
alias arr='adb reboot recovery'
alias arb='adb reboot bootloader'
alias fr='fastboot reboot'
alias asl='adb sideload'
alias ap='adb push'
alias pull='adb pull'

## mysql
# no password, please enter directly
alias my='mysql.server start; mysql -p -u root ; mysql.server stop'
alias mystart='mysql.server start'
alias mystop='mysql.server stop'

## autojump
alias j='autojump'
[[ -s "$HOME/.autojump/etc/profile.d/autojump.sh" ]] && source "$HOME/.autojump/etc/profile.d/autojump.sh"

## misc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

alias rehb='/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"'

# github
alias mine='~/GitHub/mine'

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
