{
  lib,
  config,
  ...
}: let
  cfg = config.maios.applications.terminal;
in {
  options.maios.applications.terminal.bash.enable = lib.mkEnableOption "bash";
  config.programs.bash = {
    inherit (cfg.bash) enable;
    enableCompletion = true;
    shellAliases = {
      ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      cat = "bat";
      ls = "eza --icons";
      ll = "eza -lh --icons --grid --group-directories-first";
      la = "eza -lah --icons --grid --group-directories-first";
      ".." = "cd ..";
    };
  };
}
