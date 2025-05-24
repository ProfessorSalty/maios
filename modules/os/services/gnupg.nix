{
  config,
  lib,
  ...
}: let
  cfg = config.maios.os.services;
in {
  options.maios.os.services.gnupg.enable = lib.mkEnableOption "gnupg";
  programs = {
    gnupg.agent = lib.mkIf cfg.gnupg.enable {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
