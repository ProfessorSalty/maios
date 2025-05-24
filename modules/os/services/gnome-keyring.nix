{
  config,
  lib,
  ...
}: let
  cfg = config.maios.os.services;
in {
  options.maios.os.services.gnome-keyring.enable = lib.mkEnableOption "Gnome-keyring";
  programs.gnome-keyring.enable = cfg.gnome-keyring.enable;
}
