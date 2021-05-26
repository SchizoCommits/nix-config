# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.kernelParams = [ "amd_iommu=on" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/e87cde1b-6e9d-477d-9c54-b28b3c559da5";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/58FE-599A";
      fsType = "vfat";
    };

  fileSystems."/home/4TB-HDD" =
    {
      device = "/dev/disk/by-uuid/bc419609-d636-459c-a5cd-9f392d95fcfb";
      fsType = "ext4";
    };

  fileSystems."/home/1TB-HDD" =
    {
      device = "/dev/disk/by-uuid/254c1681-14db-4a0d-a510-648e268df69e";
      fsType = "ext4";
    };

  fileSystems."/mnt/nextcloud/Music" =
    {
      device = "/home/4TB-HDD/Media/Music";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/mnt/nextcloud/Photos" =
    {
      device = "/home/4TB-HDD/Photos";
      fsType = "none";
      options = [ "bind" ];
    };

  swapDevices = [{ device = "/swapfile"; size = 16384; }];

  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };

}
