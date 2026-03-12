{ ... }: {

  # ── Delta (diff viewer) ───────────────────────────────────────────────────
  programs.delta = {
    enable               = true;
    enableGitIntegration = true;   # eksplisit, tidak deprecated
    options = {
      navigate     = true;
      side-by-side = true;
      line-numbers = true;
    };
  };

  # ── Git ───────────────────────────────────────────────────────────────────
  programs.git = {
    enable = true;

    # userName/userEmail → sudah dipindah ke settings.user.*
    settings = {
      user.name  = "dniel";
      user.email = "xiaoxaniel@gmail.com";   # ← ganti dengan email kamu

      init.defaultBranch  = "main";
      pull.rebase         = false;
      core.autocrlf       = "input";
      core.editor         = "nvim";
      merge.conflictstyle = "diff3";
      diff.colorMoved     = "default";
    };
  };
}
