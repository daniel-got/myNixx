{ ... }: {

  # xdg.configFile membuat symlink: ~/.config/<path> → nix store
  # Salin file aslimu ke home/dotfiles/<folder>/ terlebih dahulu.

  xdg.configFile = {

    # ── btop ─────────────────────────────────────────────────────────────
    "btop/btop.conf".source = ./dotfiles/btop/btop.conf;

    # ── neofetch ──────────────────────────────────────────────────────────
    "neofetch/config.conf".source = ./dotfiles/neofetch/config.conf;

  };
}
