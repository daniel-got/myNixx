{ pkgs, ... }: {

  programs.zsh = {
    enable               = true;
    enableCompletion     = true;
    autosuggestion.enable      = true;
    syntaxHighlighting.enable  = true;

    # ── Aliases ─────────────────────────────────────────────────────────
    shellAliases = {
      ls = "eza --icons";
      ll = "eza -l --icons --git -a";
      lt = "eza --tree --level=2 --icons";
    };

    # ── Oh My Zsh ───────────────────────────────────────────────────────
    oh-my-zsh = {
      enable  = true;
      plugins = [ "git" "sudo" "docker" "web-search" ];
    };

    # ── Extra Init ──────────────────────────────────────────────────────
    # Dijalankan di akhir .zshrc, setelah oh-my-zsh.
    initContent = ''
      # Load Powerlevel10k dari Nix Store (path selalu konsisten)
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

      # Load config p10k jika ada (dibuat oleh `p10k configure`, tidak dikelola Nix)
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };
}
