{
	nix.settings = {
		experimental-features = [
			"nix-command"
			"flakes"
			"repl-flake"
		];

		#sandbox = "relaxed";
	};

	nixpkgs.config = {
		allowUnfree = true;
	};
}
