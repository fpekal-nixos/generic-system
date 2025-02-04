{ machineSpecific, ... }:
{
	home.stateVersion = machineSpecific.stateVersion;

	programs = {
		zoxide = {
			enable = true;
			enableBashIntegration = true;
			options = [ "--cmd" "cd" ];
		};

		bash.enable = true;
	};
}
