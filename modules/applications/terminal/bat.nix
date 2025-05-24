{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.maios.applications.terminal;
in {
  options.maios.applications.terminal.bat.enable = lib.mkEnableOption "bat - a replacement for cat";
  config = {
    programs.bat = {
      inherit (cfg.bat) enable;
      settings = {
        pager = "less -FR";
      };
      extraPackages = with pkgs.bat-extras; [
        batman
        batpipe
        batgrep
      ];
    };
  };
}
