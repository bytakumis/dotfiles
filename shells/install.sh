fishShellConfigPath="$HOME/.config/fish/"
fishShellFunctionConfigPath="$HOME/.config/fish/functions"
pecoConfigPath="$HOME/.config/peco/"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'export PATH=/opt/homebrew/bin:$PATH' >> ~/.bashrc
brew update

echo '##################################################'
echo '# Install tools ...'
echo '##################################################'
brew install $(cat ./shells/homebrew/formulae)
pip3 install -U neovim

echo '##################################################'
echo '# Setup fish shell ...'
echo '##################################################'
# Setup default shell
sudo sh -c "echo $(which fish) >> /etc/shells"
chsh -s $(which fish)
# Setup fisher
fish ./shells/fish/fisher/install.sh
# Setup config
mkdir -p $fishShellConfigPath
cp ./shells/fish/config.fish $fishShellConfigPath
# Setup functions
mkdir -p $fishShellFunctionConfigPath
cp ./shells/fish/functions/* $fishShellFunctionConfigPath

echo '##################################################'
echo '# Setup peco ...'
echo '##################################################'
# Setup config
mkdir -p $pecoConfigPath
cp ./shells/peco/config.json $pecoConfigPath

echo '##################################################'
echo '# Setup tmux ...'
echo '##################################################'
# Setup powerline
pip3 install powerline-status

# Setup config
cp ./shells/tmux/tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf
