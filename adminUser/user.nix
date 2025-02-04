{ machineSpecific, ... } @args :
{
	users.users."${machineSpecific.adminUser}" = {
		isNormalUser = true;
		initialPassword = machineSpecific.adminInitialPass;
		description = "Filip Pekala";
		extraGroups = [ "networkmanager" "wheel" "video" "dialout" ];
	};

	home-manager.users."${machineSpecific.adminUser}" = (import ./home-manager.nix) args;
	home-manager.useUserPackages = true;
}
