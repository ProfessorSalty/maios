{
  config,
  lib,
  ...
}: let
  cfg = config.maios.applications.file-managers;
in {
  options.maios.applications.file-managers.yazi.enable = lib.mkEnableOption "Yazi TUI File Browser";
  config.programs.yazi.enable = cfg.yazi.enable;
}
