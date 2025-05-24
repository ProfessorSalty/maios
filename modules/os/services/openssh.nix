{
  config,
  lib,
  ...
}: let
  cfg = config.maios.os.services;
in {
  options.maios.os.services.openssh.enable = lib.mkEnableOption "OpenSSH Server";
  programs.openssh.enable = cfg.openssh.enable;
}
