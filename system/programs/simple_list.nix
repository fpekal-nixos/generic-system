{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		wget
		cifs-utils
		git
		tmux
		appimage-run
		htop
		ranger

		zip
		unzip
		rar
		unrar
	];
}
