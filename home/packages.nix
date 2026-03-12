{ pkgs, ... }: {

  home.packages = with pkgs; [

    # ── 1. Shell Utils & Search ───────────────────────────────────────────
    zsh-powerlevel10k  # tema zsh (di-source di zsh.nix)
    meslo-lgs-nf       # font untuk p10k
    ripgrep            # rg — grep yang cepat
    fd                 # find yang lebih enak
    fzf                # fuzzy finder
    tldr               # ringkasan man page
    wget
    curl
    unzip
    delta              # diff viewer yang lebih baik
    glow               # render markdown di terminal

    # ── 2. Golang ─────────────────────────────────────────────────────────
    go
    gopls              # Go LSP
    delve              # Go debugger

    # ── 3. Node.js / Web ──────────────────────────────────────────────────
    nodejs_22
    yarn

    # ── 4. PHP ────────────────────────────────────────────────────────────
    php

    # ── 5. Python ─────────────────────────────────────────────────────────
    python3

    # ── 6. C / C++ ────────────────────────────────────────────────────────
    gcc
    gnumake
    cmake

    # ── 7. C# / .NET ──────────────────────────────────────────────────────
    dotnet-sdk

    # ── 8. Java Stack ─────────────────────────────────────────────────────
    jdk21               # JDK 21 LTS — runtime + compiler (javac, java)
    maven               # build tool berbasis XML (pom.xml)
    gradle              # build tool modern (build.gradle)
    google-java-format  # formatter resmi gaya Google
    lombok              # @Getter, @Setter, @Builder, dll

    # ── 9. Linux-like Tools ───────────────────────────────────────────────
    coreutils
    eza                 # ls modern
    bat                 # cat dengan syntax highlight
    zoxide              # cd cerdas (integration di default.nix)
    yazi                # file manager TUI
    btop                # monitor sistem
    jq                  # JSON processor

    # ── 10. Fun / Media ───────────────────────────────────────────────────
    ani-cli
    ffmpeg
    mpv

    # ── 11. Database ──────────────────────────────────────────────────────
    postgresql
    openssl
    zlib

    # ── 12. Web Dev ───────────────────────────────────────────────────────
    posting
    docker_29
    docker-compose
    drawio
  ];
}
