{
  username,
  lib,
  config,
  ...
}: {
  options.maios.services.syncthing = {
    enable = lib.mkEnableOption "";
    dataDir = lib.mkOption {
      type = lib.types.string;
      description = "Directory to sync";
      default = "/home/${username}";
    };
    configDir = lib.mkOption {
      type = lib.types.string;
      description = "Directory containing the configuration";
      default = "/home/${username}/.config/syncthing";
    };
  };
  services.syncthing = {
    enable = false;
    user = "${username}";
    inherit (config.maios.services.syncthing) dataDir configDir;
  };
}
