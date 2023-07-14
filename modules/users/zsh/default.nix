{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.zsh;
in {
  options.cv.zsh.enable = mkOption {
    description = "Enable zsh";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    home.packages = with pkgs; [zsh];

    home.file = {
      zshenv = {
        enable = true;
        source = ./zshenv;
        target = ".zshenv";
      };

      zprofile = {
        enable = true;
        source = ./zprofile;
        target = ".zprofile";
      };

      zshrc = {
        enable = true;
        source = ./zshrc;
        target = ".zshrc";
      };

      zsh-plugins = {
        enable = true;
        source = ./zsh_plugins.txt;
        target = ".zsh_plugins.txt";
      };

      p10k = {
        enable = true;
        source = ./p10k.zsh;
        target = ".p10k.zsh";
      };
    };
  };
}
