#!/bin/zsh
set -euo pipefail
cd ~
# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git 
#  mpgd xifd ov this-ll work, mau need to run manually)
zsh -c 'source zsh-snap/install.zsh' 
# pk`0`
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# 
echo "$(curl -fsSL https://gist.githubusercontent.com/tyhuber1/40d1935a8cf71c0a16a04b2724b37ccd/raw/85c794ec7d2ca3ec528b3cee1ea679ebb26eaaae/.zshrc)" > ~/.zshrc

source ~/.zshrc
