# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Download Znap, if it's not there yet.
[[ -f ~/zsh/zsh-snap/znap.zsh ]] || git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/zsh/zsh-snap

source ~/zsh/zsh-snap/znap.zsh  # Start Znapxx

znap prompt romkatv/powerlevel10k

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias k='kubectl'
znap fpath _kubectl 'kubectl completion  zsh'
znap fpath _rustup  'rustup  completions zsh'cs
znap fpath _cargo   'rustup  completions zsh cargo'
# `znap source` automatically downloads and starts your plugins.
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source git
znap source heroku
znap source pip
znap source lein
znap source command-not-found
znap source zsh-autosuggestions
znap source zsh-autocomplete
znap source zsh-users/zsh-history-substring-search
znap source aperezdc/zsh-fzy
znap source jimeh/zsh-peco-history
znap source oknowton/zsh-dwim
znap source Downager/zsh-helmfile
# `znap eval` caches and runs any kind of command output for you.
znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

# `znap function` lets you lazy-load features you don't always need.
znap function _pyenv pyenv 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

export GOROOT="/home/tyhuber/go"