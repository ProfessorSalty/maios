{inputs, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];
  catppuccin = {
    accent = "blue";
    flavor = "mocha";
  };
}
