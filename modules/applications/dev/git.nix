{
  lib,
  config,
  ...
}: let
  inherit (config.maios) user;
in {
  options.maios.applications.dev.git = {
    enable = lib.mkEnableOption "Enable git; set the username and email";

    userName = lib.mkOption {
      description = "The name to configure Git with.";
      type = lib.types.str;
      default = user.fullName;
    };

    userEmail = lib.mkOption {
      description = "The email to configure Git with.";
      type = lib.types.str;
      default = user.gitEmail;
    };

    signingKey = lib.mkOption {
      description = "The key ID to sign commits with.";
      type = lib.types.str;
      default = "";
    };
  };

  config = {
    programs.git = {
      inherit (config.maios.applications.dev.git) enable;
      extraConfig = {
        push = {autoSetupRemote = true;};
      };
    };
  };
}
