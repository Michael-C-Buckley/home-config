_: {
  vim = {
    languages = import ./languages;

    autocomplete.blink-cmp.enable = true;
    tabline.nvimBufferline.enable = true;

    runner.run-nvim = {
      enable = true;
    };
  };
}
