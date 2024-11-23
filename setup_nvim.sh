#make directry
echo "設定ファイルを配置するディレクトリを作成"
echo "Create a directory to place the configuration files."
makedir () {
  if [ ! -e $HOME/$1 ]; then
    mkdir $HOME/$1
  fi
}
makedir .config/nvim
ln -snf `pwd`/nvim/init.lua $HOME/.config/nvim/init.lua
ln -snf `pwd`/nvim/plugins $HOME/.config/nvim/plugins
ln -snf `pwd`/nvim/snippets $HOME/.config/nvim/snippets
ln -snf `pwd`/nvim/ftplugin $HOME/.config/nvim/ftplugin
ln -snf `pwd`/nvim/rc $HOME/.config/nvim/rc
