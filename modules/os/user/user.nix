{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.maios.user;

  is-darwin = pkgs.stdenv.isDarwin;

  home-directory =
    if cfg.name == null
    then null
    else if is-darwin
    then "/Users/${cfg.name}"
    else "/home/${cfg.name}";
in {
  options = {
    maios = {
      hostname = lib.mkOption {
        description = "";
        type = lib.types.str;
      };

      os.printing = lib.mkOption {
        description = "";
        type = lib.types.boolean;
      };

      user = {
        name = lib.mkOption {
          description = "Name for the user account";
          type = lib.types.str;
        };

        githubUsername = lib.mkOption {
          description = "Username for GitHub";
          type = lib.types.str;
          default = config.maios.user.username;
        };
        gitEmail = lib.mkOption {
          description = "Email to associate on commits";
          type = lib.types.str;
          default = config.maios.user.email;
        };
        defaultBrowser = lib.mkOption {
          description = "";
          type = lib.types.str;
          default = "firefox";
        };
        fullName = lib.mkOption {
          description = "The full name of the user.";
          type = lib.types.str;
        };
        userImage = lib.mkOption {
          description = "Image used for login";
          type = lib.types.str;
          default = "/home/${config.maios.user.username}/.config/face.jpg";
        };

        email = lib.mkOption {
          description = "The email address of the user.";
          type = lib.types.str;
        };

        home = lib.mkOption {
          description = "The user's home directory";
          type = lib.types.nullOr lib.types.str;
          default = home-directory;
        };
      };
    };
  };
  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = cfg.name != null;
        message = "plusultra.user.name must be set";
      }
      {
        assertion = cfg.home != null;
        message = "plusultra.user.home must be set";
      }
    ];

    home = {
      username = lib.mkDefault cfg.name;
      homeDirectory = lib.mkDefault cfg.home;
    };
  };
}
