{
  pkgs,
  lib,
  config,
  ...
}: {
  options.maios.programs.localsend = {
    enable = lib.mkEnableOption "Enables localsend";
  };
  config = lib.mkIf config.maios.programs.localsend.enable {
    environment.systemPackages = with pkgs; [localsend];
  };
}
