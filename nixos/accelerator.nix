#Labukas
{ pkgs, lib,config, ... }:

{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-compute-runtime # OpenCL filter support (hardware tonemapping and subtitle burn-in)
    ];
  };
  hardware.nvidia.modesetting.enable = true;

  hardware.opengl.package = pkgs.mesa_drivers;

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  # hardware.bumblebee.enable = true;
  # hardware.bumblebee.connectDisplay = true;
  # hardware.nvidia.prime.sync.enable = true;

  # hardware.nvidia.prime = {
  #   # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
  #   intelBusId = "PCI:0:2:0";
  #   # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
  #   nvidiaBusId = "PCI:1:0:0";
  # };
}