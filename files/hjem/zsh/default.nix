{inputs, system, ...}:
{
  hjem.users.michael = {
    files = {
      ".config/resources/geometry".source = "${inputs.geometry.packages.${system}}";
      ".zshrc".source = ./default.zshrc;
    };
  };
}
