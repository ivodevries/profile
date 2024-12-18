#todo gitconfig with password
#append instead of replace bashrc / bash_profile
cd ~
#ln -s profile/.bash_profile
#ln -s profile/.bashrc
ln -s profile/.dir_colors
#ln -s profile/.gitconfig
#ln -s profile/.jshintrc
ln -s profile/.screenrc
ln -s profile/.vimrc
ln -s profile/.vim
ln -s profile/scripts
grep -qxF 'source ~/profile/.bashrc' ~/.bashrc || echo 'source ~/profile/.bashrc' >> ~/.bashrc
