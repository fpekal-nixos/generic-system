self:
{ ... }:
let
	authorizedKeysList =
	map (x: x.publicKey) (builtins.attrValues self.lib.systems);
in
{
	config.users.users.filip.openssh.authorizedKeys.keys = authorizedKeysList;
}
