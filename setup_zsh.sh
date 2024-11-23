# pre-requirements
# - zsh
# - rustup
# - eza -> cargo install eza
# - nvm
# - rye
# - go
chsh -s /bin/zsh
makedir () {
  if [ ! -e $HOME/$1 ]; then
    mkdir $HOME/$1
  fi
}
makedir .config

# install eza
cargo install eza
# install starship
curl -sS https://starship.rs/install.sh | sh
# install sheldon
# rustup update
cargo install sheldon

# config setup
ln -snf `pwd`/zsh/zshrc $HOME/.zshrc
ln -snf `pwd`/zsh/starship.toml $HOME/.config/starship.toml
ln -snf `pwd`/zsh/sheldon $HOME/.config/sheldon
