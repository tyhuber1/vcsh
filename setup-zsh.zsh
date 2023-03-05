#!/bin/bash
set -euo pipefail
D=$PWD
cd ~
# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git 
#  mpgd xifd ov this-ll work, mau need to run manually)
zsh -c 'source zsh-snap/install.zsh' 
# pk`0`
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# 
cp $D/.zshrc ~/.zshrc

source ~/.zshrc
