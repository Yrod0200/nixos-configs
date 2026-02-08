{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    
    theme = "dark_plus";

	settings = {
    	window.opacity = 0.85; # Adjust between 0.0 and 1.0
		window.blur = true;
  	};
  };
}
