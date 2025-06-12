{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

		nixosBlankSystem.url = "github:fpekal-nixos/nixos-template";
		nixosBlankSystem.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs =
		{ self, nixosBlankSystem, ... }:
		{
			systems.generic = nixosBlankSystem.systems.minimal.extend { modules = [ ./modules ./overlays ./packages ./users ./hosts ./shells ./options ]; };

			nixosConfigurations.example = self.systems.generic.mksystem { system = "x86_64-linux"; specialArgs = { host = "nixos"; users = [ ]; }; };
		};
}

