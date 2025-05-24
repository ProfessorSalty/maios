{
  lib,
  config,
  pkgs,
  ...
}: {
  options.maios.applications.security.yubi = {
    enable = lib.mkEnableOption "Setup applications for managing YubiKey";
  };

  config = lib.mkIf config.maios.applications.security.yubi.enable {
    services.udev.packages = [pkgs.yubikey-personalization];

    environment.systemPackages = with pkgs; [
      yubikey-manager
    ];

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
