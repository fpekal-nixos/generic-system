{ config, impurity, ... }:
let
	nixos-config = config;
in
{
	home-manager.users.filip =
		{ config, ... }: {
		home.file.nvim-config = {
			source = impurity.link ./nvim-config;
			target = ".config/nvim";
		};
	};

	sops.secrets."neovim/codecompanion-key" = {
		path = "/home/filip/.secrets/nvim-codecompanion.key";
		owner = "filip";
	};
}
