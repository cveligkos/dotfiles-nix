{ pkgs
, config
, lib
, ...
}:
with lib; let
  cfg = config.cv.wezterm;
in
{
  options.cv.wezterm.enable = mkOption {
    description = "Enable wezterm";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    home.packages = with pkgs; [
      wezterm
    ];

    home.file = {
      wezterm-config = {
        enable = true;
        source = ./config;
        target = ".config/wezterm";
        recursive = true;
      };
    };
  };
}
