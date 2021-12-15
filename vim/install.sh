nvimConfigPath="$HOME/.config/nvim/"
uname=$(whoami)

# setup config nvim file
echo '##################################################'
echo '# Setup vim'
echo '##################################################'
sed -i -e "s/username/$uname/" ./vim/init.vim
mkdir -p $nvimConfigPath

# Install deinvim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $HOME/.vim/dein
nvim '+call dein#install()' '+qall'

cp ./vim/init.vim $nvimConfigPath

