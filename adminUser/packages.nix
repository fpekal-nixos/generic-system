{ pkgs, machineSpecific, ... }:
{
	home-manager.users."${machineSpecific.adminUser}".home.packages = 
	with pkgs;
	[
		htop
		zip
		unzip
	];
}
