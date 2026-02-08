{ config, pkgs, ...}:


{

	home.packages = with pkgs; [
		micro
		cmatrix
		vscode
		kitty
		go
		gcc

		discord
		cmus
		cmusfm
		prismlauncher

		wget
		fastfetch
		bibata-cursors
		htop

		cava	
	];






}
