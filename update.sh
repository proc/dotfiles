echo 'Updating git repo...'
git pull --rebase
echo 'Copying .vimrc to ~ ...'
cp ./.vimrc ~
echo 'Copying .bash_profile to ~ ...'
cp ./.bash_profile ~
echo 'Sourcing ~/.bash_profile...'
source ~/.bash_profile
echo 'Updated'
