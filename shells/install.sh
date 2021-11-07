fishShellConfigPath="$HOME/.config/fish/"
fishShellFunctionConfigPath="$HOME/.config/fish/functions"
pecoConfigPath="$HOME/.config/peco/"

echo '##################################################'
echo '# Install Homebrew ...'
echo '##################################################'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

echo '##################################################'
echo '# Install tools ...'
echo '##################################################'
brew install $(cat ./shells/homebrew/package)
pip3 install -U neovim

echo '##################################################'
echo '# Setup fish shell ...'
echo '##################################################'
# Setup default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
# Setup fisher
fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install rafaelrinaldi/pure
fisher install jethrokuan/z
fisher install b4b4r07/enhancd
# Setup config
mkdir -p $fishShellConfigPath
cp ./shells/fish/config.fish $fishShellConfigPath
# Setup functions
mkdir -p $fishShellFunctionConfigPath
cp ./shells/fish/functions/* $fishShellFunctionConfigPath

clear;fish

echo '##################################################'
echo '# Setup peco ...'
echo '##################################################'
# Setup config
mkdir -p $pecoConfigPath
cp ./shells/peco/config.fish $pecoConfigPath

