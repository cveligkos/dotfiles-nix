{ pkgs, config, lib, ... }:
with lib;

let
	cfg = config.cv.git;
in {
	options.cv.git = {
		enable = mkOption {
			description = "Enable git";
			type = types.bool;
			default = false;
		};

		userName = mkOption {
			description = "Name for git";
			type = types.str;
			default = "Christos Veligkos";
		};

		userEmail = mkOption {
			description = "Email for git";
			type = types.str;
			default = "cveligkos@gmail.com";
		};
	};

	config = mkIf (cfg.enable) {
		programs.git = {
			enable = true;
			userName = cfg.userName;
			userEmail = cfg.userEmail;
			extraConfig = {
				credential.helper = "${
					pkgs.git.override { withLibsecret = true; }
				}/bin/git-credential-libsecret";
			};
		};
	};
}