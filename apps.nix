# apps.nix

{config, pkgs, ...}:

{
	fonts.fontconfig.enable = true;

# -- Fontes com ícones (Nerd Fonts)
	fonts.packages = with pkgs; [
		nerd-fonts.hack
		font-awesome
		noto-fonts
	];	


	# Instalando o firefox
	programs.firefox.enable = true;

	# Instalando o doas
	security.doas.enable = true;
	security.doas.extraRules = [{
 	 	users = ["yuri"];
 	 	# Optional, retains environment variables while running commands 
 	 	# e.g. retains your NIX_PATH when applying your config
		keepEnv = true; 
		persist = true;  # Optional, only require password verification a single time
	}];


	# Instalando a steam
	programs.steam.enable = true;

 
	virtualisation.libvirtd.enable = true;
	programs.virt-manager.enable = true;


	# Instalando o Flatpak 
	services.flatpak.enable = true;

    # Instalando o clamAv
    services.clamav.daemon.enable = true;
    services.clamav.updater.enable = true;
	
    networking.firewall.trustedInterfaces = [ "virbr0" ];

# -- Habilitando o clamAV
	environment.systemPackages = with pkgs; [
		clamav


		git
	];
}
