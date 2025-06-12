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
		moje = {
			url = "github:fpekal-nixos/all";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		zen-browser = {
			url = "github:youwen5/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs =
	{ nixpkgs, home-manager, sops-nix, moje, self, zen-browser }:
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

						nixpkgs.overlays = [
							moje.overlays.default
							(final: prev: {
								zen-browser = zen-browser.packages.x86_64-linux.zen-browser;
							})
						];
					}
					home-manager.nixosModules.home-manager
					sops-nix.nixosModules.sops
					moje.nixosModules.default
				] ++ (machineSpecific.modules);
			};
		};

		nixosConfigurations = {
			example = self.lib.createSystem {
				system = "x86_64-linux";
				stateVersion = "24.11";
				adminUser = "filip";
				adminInitialPass = "genowefa";
				modules = [];
			};
		};
	};
}
