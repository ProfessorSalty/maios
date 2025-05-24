{
  config,
  lib,
  ...
}: let
  cfg = config.maios.os.services;
in {
  options.maios.os.services.dconf.enable = lib.mkEnableOption "dconf";
  programs = {
    dconf.enable = cfg.dconf.enable;
  };
}
