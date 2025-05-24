_: {
  imports = [
    ./hardware.nix
    ../../modules
    ../../profiles/intel
  ];
  config = {
    maios = {
      hostname = "flathead";

      user = {
        enable = true;
        username = "gregorysmith";
        githubUsername = "professorsalty";
        gitEmail = "me@gregsmith.nyc";
        defaultBrowser = "firefox";
      };

      services = {
        nfs.enable = true;
      };

      os = {
        printing.enable = true;
        desktop-environments = {
          hyprland.enable = true;
        };
        audio = {
          pipewire.enable = true;
        };
      };

      applications = {
        browsers = {
          firefox.enable = true;
          librewolf.enable = true;
        };
        editors = {
          vim.enable = true;
          micro.enable = true;
        };
        file-managers = {
          yazi.enable = true;
        };
        security = {
          bitwarden.enable = true;
          yubi.enable = true;
        };
        media = {
          steam.enable = true;
          lmms.enable = true;
          vlc.enable = true;
          obs-studio.enable = true;
        };
        terminal = {enableAll = true;};
      };
    };
  };
}
