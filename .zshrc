# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/apurandare/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
DEFAULT_USER="apurandare"

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
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ZSH syntax & auto-complete
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ZPrezto https://github.com/sorin-ionescu/prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Kops Kubernetes Settings
source ~/.kops-k8s.zsh
source ~/.kops.zsh

source <(kubectl completion zsh)
# Add kubectl aliases
source ~/.kubectl_aliases

# Go Path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# aliases
alias brewup="brew update && brew upgrade && brew cu && brew cleanup && mas upgrade"
alias python='python3'
alias pip='pip3'
alias vi='vim'
alias utc='date -u'

# MySQL conf
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# Crontabs
export PATH="$PATH:~/.crontab"

# Remove stale containers
function rm_containers() {
    docker ps -a | cut -c 1-12 | sed 1d | while read -r line; do docker rm "$line"; done
}

# Install kubernetes krew plugin manager
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Add kubernetes context
function kubernetes_context() {
    if [[ -n "$KUBECONFIG" ]]; then
        CONTEXT="$(kubectl config current-context)"
        if [[ -n "$CONTEXT" ]]; then
            echo "[${CONTEXT}]"
        fi
    fi
}

if [[ -n "$($SHELL -c 'echo $ZSH_VERSION')" ]]; then
    RPROMPT='$(kubernetes_context)'
fi

# Add ZSH plugin manager
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

autoload -U colors; colors
source /usr/local/Cellar/zsh-kubectl-prompt/v1.0.1/etc/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# opam configuration
test -r /Users/apurandare/.opam/opam-init/init.zsh && . /Users/apurandare/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PATH="/usr/local/opt/scala@2.12/bin:$PATH"
