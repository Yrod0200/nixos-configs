{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
 	  ./desktop.nix
	  ./apps.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true; 
  boot.loader.grub.configurationLimit = 10;

  # Garbage Collector roda toda semana pra limpar as generations antigas
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
	persistent = true;
  };

  
  # flakes :D
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Adicionando o zsh para não ocorrerem conflitos com o home-manager
  programs.zsh.enable = true;


  # Usando o último kernel da branch
   boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nix-os"; # Hostname

  
  # Habilitar WiFi
  networking.networkmanager.enable = true;

  # Applet de WiFi
  programs.nm-applet.enable = true;

  # Definindo minha timezone
  time.timeZone = "America/Sao_Paulo";

  # pt-Br
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };


  # Pipewire para aúdio (melhor que pulseaudio btw)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    #media-session.enable = true;
  };


  #Permitindo closed-source
  nixpkgs.config.allowUnfree = true;

  
  # Conta de usuário (mude para seu nome se quiser)
  users.users.yuri = {
  	shell =  pkgs.zsh;
    isNormalUser = true;
    description = "Yuri";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  home-manager bem melhor
    ];
  };

  system.stateVersion = "25.11";

}
