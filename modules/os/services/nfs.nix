{
  config,
  lib,
  ...
}: let
  enableNFS = config.maios.services.nfs.enable;
in {
  options.maios.services.nfs.enable = lib.mkEnableOption "Enable NFS server with rpcbind";
  config.services = {
    rpcbind.enable = enableNFS;
    nfs.server.enable = enableNFS;
  };
}
