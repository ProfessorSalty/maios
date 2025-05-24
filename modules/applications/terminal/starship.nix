{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.applications.terminal;
in {
  options.maios.applications.terminal.starship = {
    enable = lib.mkEnableOption "Starship!!!";
  };
  config.programs.starship = {
    inherit (cfg.starship) enable;
    package = pkgs.starship;
  };
}
