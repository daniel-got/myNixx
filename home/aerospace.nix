{ ... }: {

  # .aerospace.toml harus ada di ~ (home root), bukan ~/.config
  # home.file membuat symlink: ~/.aerospace.toml → nix store
  home.file.".aerospace.toml".source = ./dotfiles/.aerospace.toml;
}
