# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.autoLogin = {
    enable = true;
    user = "alice";
  };

  # It auto-logged in.
  users.users.alice =
  { isNormalUser = true;
    home = "/home/alice";
    description = "Alice Foobar";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # For serial inside the qemu vm.
  users.users.root.initialHashedPassword = "";
  services.mingetty.autologinUser = "root";
  system.stateVersion = "18.03"; # Did you read the comment?
}
