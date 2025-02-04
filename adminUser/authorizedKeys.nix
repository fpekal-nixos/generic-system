{ machineSpecific, ... }:
let
	authorizedKeysList =
	map (x: x.publicKey) (builtins.attrValues (import ../systems.nix));
in
{
	config.users.users."${machineSpecific.adminUser}".openssh.authorizedKeys.keys = authorizedKeysList;
}
