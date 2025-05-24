{
  lib,
  config,
  ...
}: let
  cfg = config.applications.terminal;
in {
  options.maios.applications.terminal.zoxide = {
    enable = lib.mkEnableOption "Zoxide";
  };
  config.programs = {
    zoxide = {
      inherit (cfg.zoxide) enable;
      enableZshIntegration = true;
      enableBashIntegration = true;
      options = [
        "--cmd cd"
      ];
    };
  };
}
