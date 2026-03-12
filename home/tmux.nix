{ ... }: {

  programs.tmux = {
    enable    = true;
    shortcut  = "a";      # prefix → Ctrl+a
    baseIndex = 1;        # mulai dari window 1, bukan 0

    extraConfig = ''
      # ── Split panes ──────────────────────────────────────────────────
      bind | split-window -h   # split horizontal
      bind - split-window -v   # split vertikal
      unbind '"'
      unbind %

      # ── Navigasi pane (vim-style) ─────────────────────────────────────
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # ── Mouse support ────────────────────────────────────────────────
      set -g mouse on
    '';
  };
}
