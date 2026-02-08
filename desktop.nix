{ config, pkgs, ... }:

{


  console.keyMap = "br-abnt2";

  ###### X11 (necessário pro SDDM e apps legados)
  services.xserver = {
    enable = true;
	
    # Layout de teclado
    xkb = {
      layout = "br";
      variant = "";
    };

    # SDDM como display manager
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };


  services.desktopManager.plasma6.enable = true;


}
