#!/bin/fish

echo '##################################################'
echo '# Setup fisher ...'
echo '##################################################'
# Setup fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install rafaelrinaldi/pure
fisher install jethrokuan/z
fisher install b4b4r07/enhancd

