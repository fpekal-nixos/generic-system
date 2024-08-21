{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs";
	};

	outputs =
	{ nixpkgs, self }:
	{
		nixosModules = {
			nix-config = import ./nix-config.nix;
		};
	};
}
