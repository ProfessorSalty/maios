{lib, ...}: {
  options.maios.os.desktop-environments = {
    hyprland.enable = lib.mkEnableOption "Enable preconfigured hyprland DE";
  };

  imports = [
    ./hyprland
  ];
}
