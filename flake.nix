{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs";
	};

	outputs =
	{ nixpkgs, self }:
	{
		lib = {
			systems = import ./systems.nix;
		};

		nixosModules = {
			nix-config = import ./nix-config.nix;
			authorized-keys = import ./authorized-keys.nix self;

			default =
			{ ... }:
			{
				imports = with self.nixosModules; [
					nix-config
					authorized-keys
				];
			};
		};
	};
}
