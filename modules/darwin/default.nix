{ pkgs, config, lib, ... }: {

  # ──────────────────────────────────────────────────────────────────────────
  # SYSTEM SETTINGS
  # ──────────────────────────────────────────────────────────────────────────
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion      = 6;
  nixpkgs.hostPlatform     = "aarch64-darwin";

  # ──────────────────────────────────────────────────────────────────────────
  # USER
  # ──────────────────────────────────────────────────────────────────────────
  users.users.dniel = {
    name = "dniel";
    home = "/Users/dniel";
  };
  system.primaryUser = "dniel";

  # ──────────────────────────────────────────────────────────────────────────
  # SYSTEM PACKAGES
  # Hanya tools yang benar-benar butuh level OS.
  # Jangan taruh dev tools di sini — taruh di home/packages.nix.
  # ──────────────────────────────────────────────────────────────────────────
  environment.systemPackages = [
    pkgs.mkalias   # diperlukan oleh activationScript di bawah
  ];

  # ──────────────────────────────────────────────────────────────────────────
  # MACOS DEFAULTS
  # ──────────────────────────────────────────────────────────────────────────
  system.defaults = {
    dock.autohide               = true;
    finder.AppleShowAllExtensions = true;
  };

  # ──────────────────────────────────────────────────────────────────────────
  # HOMEBREW
  # ──────────────────────────────────────────────────────────────────────────
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade    = true;
      cleanup    = "zap";
    };

    brews = [
      "mas"
      "composer"
      "mysql"
      "lazygit"
      "tea"
      "ghostscript"
    ];

    casks = [
      "hammerspoon"
      "firefox"
      "iina"
      "the-unarchiver"
      "iterm2"
      "ghostty"
      "orbstack"
      "steam"
      "chromedriver"
      "localsend"
      "betterdisplay"
      "linearmouse"
      "raycast"
      "nikitabobko/tap/aerospace"
    ];
  };

  # ──────────────────────────────────────────────────────────────────────────
  # FONTS
  # ──────────────────────────────────────────────────────────────────────────
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    liberation_ttf
    inter
    ubuntu-classic
    fira-code
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  # ──────────────────────────────────────────────────────────────────────────
  # ACTIVATION SCRIPT
  # Buat alias di /Applications agar Spotlight bisa index app dari Nix store.
  # ──────────────────────────────────────────────────────────────────────────
  system.activationScripts.applications.text =
    let
      env = pkgs.buildEnv {
        name         = "system-applications";
        paths        = config.environment.systemPackages;
        pathsToLink  = [ "/Applications" ];
      };
    in
    lib.mkForce ''
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink -f '{}' \; | \
        while read -r src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
    '';
}
