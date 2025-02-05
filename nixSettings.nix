{
	nix.settings = {
		experimental-features = [
			"nix-command"
			"flakes"
		];

		#sandbox = "relaxed";
	};

	nixpkgs.config = {
		allowUnfree = true;
	};
}
