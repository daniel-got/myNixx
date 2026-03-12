{ pkgs, ... }: {

  imports = [
    ./packages.nix
    ./zsh.nix
    ./neovim.nix
    ./tmux.nix
    ./git.nix
    ./aerospace.nix
    ./xdg.nix
  ];

  home.stateVersion = "24.05";

  # ──────────────────────────────────────────────────────────────────────────
  # ENV VARIABLES
  # Diset di sini agar semua program (termasuk Neovim GUI) bisa membaca.
  # ──────────────────────────────────────────────────────────────────────────
  home.sessionVariables = {
    JAVA_HOME  = "${pkgs.jdk21}";
    LOMBOK_JAR = "${pkgs.lombok}/share/java/lombok.jar";
  };

  home.sessionPath = [
    "${pkgs.jdk21}/bin"
  ];

  # ──────────────────────────────────────────────────────────────────────────
  # ZOXIDE  (cd replacement)
  # ──────────────────────────────────────────────────────────────────────────
  programs.zoxide = {
    enable             = true;
    enableZshIntegration = true;
    options            = [ "--cmd cd" ];
  };
}
