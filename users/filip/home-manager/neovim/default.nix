{ config, impurity, ... }:
{
	impurity.enable = true;

	home-manager.users.filip = {
		home.file.nvim-config = {
			source = impurity.link ./nvim-config;
			target = ".config/nvim";
			recursive = true;
		};
	};

	sops.secrets."neovim/codecompanion-key" = {
		path = "/home/filip/.config/nvim/lua/plugins/codecompanion.key";
		owner = "filip";
	};
}
