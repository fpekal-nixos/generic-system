{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs";
		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		sops-nix = {
			url = "github:Mic92/sops-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs =
	{ nixpkgs, home-manager, sops-nix, self }:
	{
		lib = {
			createSystem =
			machineSpecific:
			nixpkgs.lib.nixosSystem {
				system = machineSpecific.system;

				modules = [
					./modules.nix
					{
						system.stateVersion = machineSpecific.stateVersion;
						_module.args.machineSpecific = machineSpecific;
					}
					home-manager.nixosModules.home-manager
					sops-nix.nixosModules.sops
				] ++ (machineSpecific.modules);
			};
		};

		nixosConfigurations = {
			example = self.lib.createSystem {
				system = "x86_64-linux";
				stateVersion = "21.11";
				adminUser = "filip";
				adminInitialPass = "genowefa";
				modules = [];
			};
		};
	};
}
