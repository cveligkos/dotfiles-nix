{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.fonts;
in {
  options.cv.fonts.enable = mkOption {
    description = "Enable font options";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    fonts.fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "CascadiaCode"
          "CodeNewRoman"
          "JetBrainsMono"
          "IosevkaTerm"
          "Hack"
        ];
      })
    ];
  };
}
