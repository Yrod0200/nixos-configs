{ config, pkgs, ... }:


{
	imports = [
		./core.nix
		./programs/zsh.nix
		./programs/git.nix
		./programs/alacritty.nix
	];
	
	home.username = "yuri";
	home.homeDirectory = "/home/yuri";

	

	home.stateVersion = "25.11";


	programs.home-manager.enable = true;
	
}
