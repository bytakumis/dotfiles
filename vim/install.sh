readonly nvimConfigPath="$HOME/.config/testnvim/"

# setup config nvim file
echo '##################################################'
echo '# Setup vim'
echo '##################################################'
mkdir -p $nvimConfigPath
cp ./vim/init.vim $nvimConfigPath

# Install deinvim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein
vim '+call dein#install()' '+qall'
