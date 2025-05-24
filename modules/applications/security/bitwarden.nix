{
  pkgs,
  lib,
  config,
  ...
}: {
  options.maios.applications.security.bitwarden.enable = lib.mkEnableOption "Bitwarden Desktop Client & CLI";
  config = lib.mkIf config.maios.applications.security.bitwarden.enable {
    environment.systemPackages = with pkgs; [
      bitwarden
      bitwarden-cli
    ];
  };
}
