{ pkgs, ... }: {

  # ──────────────────────────────────────────────────────────────────────────
  # NEOVIM
  #
  # extraPackages = binary yang di-inject langsung ke PATH wrapper nvim.
  # Ini memastikan LSP, formatter, dan compiler selalu tersedia bahkan jika
  # nvim dijalankan dari luar shell (contoh: GUI launcher, launchd, dll).
  # ──────────────────────────────────────────────────────────────────────────
  programs.neovim = {
    enable        = true;
    defaultEditor = true;
    viAlias       = true;
    vimAlias      = true;

    extraPackages = with pkgs; [
      # Core build deps (Treesitter compile parser, Mason)
      gcc
      gnumake
      nodejs_22     # Copilot, Mason, banyak LSP
      ripgrep       # Telescope / fzf-lua
      fd            # file searching
      unzip         # Mason
      tree-sitter   # parser core

      # ── Java Stack untuk Neovim ────────────────────────────────────────
      jdt-language-server  # JDTLS — dipanggil nvim-jdtls
      jdk21                # Java runtime yang dipakai jdtls
      google-java-format   # conform.nvim format-on-save
    ];
  };
}
