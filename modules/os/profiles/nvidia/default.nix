_: {
  # Enable GPU Drivers
  drivers = {
    amdgpu.enable = false;
    nvidia.enable = true;
    nvidia-prime.enable = false;
    intel.enable = false;
  };
  vm.guest-services.enable = false;
}
