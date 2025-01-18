{lib, ...}: {
  imports = [
    ./packages
    ./programs
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "michael";
    homeDirectory = "/home/michael";
    stateVersion = lib.mkDefault "24.05";
  };

  # home.file = {
  #   "config/ghostty/config" = {
  #     text = ''

  #     ''
  #   };
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/michael/etc/profile.d/hm-session-vars.sh
  #

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "librewolf";
    NIXOS_OZONE_WL = "1";
    GTK_USE_PORTAL = "1";
  };
}
