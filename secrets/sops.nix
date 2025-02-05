{ machineSpecific, config, ... }:
{
	sops = {
		defaultSopsFile = ./secrets/secrets.yaml;
		defaultSopsFormat = "yaml";

		age.keyFile = "/home/${machineSpecific.adminUser}/.config/sops/age/keys.txt";

		secrets = {
			"vpn/pwr/username" = {};
			"vpn/pwr/password" = {};
			"vpn/tailscale/everest-key" = {};
			"vpn/tailscale/table-key" = {};
		};
	};

	environment.etc."test.txt".text = config.sops.secrets."vpn/pwr/username".path;
}
