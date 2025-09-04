_: {
  imports = [
    ./languages/extra.nix
  ];

  vim = {
    autocomplete.blink-cmp.enable = true;

    runner.run-nvim = {
      enable = true;
    };
  };
}
