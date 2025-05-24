{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.maios.applications.media;
in {
  options.maios.applications.media.steam = {
    enable = lib.mkEnableOption "Steam";
    autoStart = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.steam.enable {
    environment.systemPackages = with pkgs; [mangohud];
    programs = {
      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = false;
        gamescopeSession.enable = true;
        extraCompatPackages = [pkgs.proton-ge-bin];
      };

      gamescope = {
        enable = true;
        capSysNice = true;
        args = [
          "--rt"
          "--expose-wayland"
        ];
      };
    };

    systemd.user.services.steam = {
      enable = cfg.steam.autoStart;
      description = "Open Steam in the background at boot";
      serviceConfig = {
        ExecStart = "${pkgs.steam}/bin/steam -nochatui -nofriendsui -silent %U";
        wantedBy = ["graphical-session.target"];
        Restart = "on-failure";
        RestartSec = "5s";
      };
    };
  };
}
