{ pkgs }:
{
	envionment.systemPackages = with pkgs; [
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
		7zip
	];
}
