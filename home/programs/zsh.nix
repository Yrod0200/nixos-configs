{ config, pkgs, ...}:

{

 programs.zsh = {
	enable = true;

    # Oh My Zsh
	oh-my-zsh = {
		enable = true;
		theme = "bira";

			
	};

	shellAliases = {
		rebuild = "sudo nixos-rebuild switch";
		nedit = "sudo micro /etc/nixos/configuration.nix";
		sudo =  "doas";

	};
  };

  
}
