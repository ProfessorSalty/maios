{
  pkgs,
  lib,
  config,
  ...
}: {
  options.maios.applications.editors.micro.enable = lib.mkEnableOption "Micro Editor";

  config.environment = lib.mkIf config.maios.applications.editors.micro.enable {
    systemPackages = with pkgs; [micro];
  };
}
