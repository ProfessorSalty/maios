{
  config,
  lib,
  ...
}: let
  cfg = config.maios.os.services;
in {
  options.maios.os.services.fuse.enable = lib.mkEnableOption "fuse";
  programs.fuse.userAllowOther = cfg.fuse.enable;
}
