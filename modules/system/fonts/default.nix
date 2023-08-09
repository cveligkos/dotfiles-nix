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
    fonts.packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          # "CascadiaCode"
          # "CodeNewRoman"
          # "JetBrainsMono"
          # "IosevkaTerm"
          # "Hack"
          "3270"
          "Agave"
          "AnonymousPro"
          "Arimo"
          "AurulentSansMono"
          "BigBlueTerminal"
          "BitstreamVeraSansMono"
          "CascadiaCode"
          "CodeNewRoman"
          "ComicShannsMono"
          "Cousine"
          "DaddyTimeMono"
          "DejaVuSansMono"
          "DroidSansMono"
          "FantasqueSansMono"
          "FiraCode"
          "FiraMono"
          "Go-Mono"
          "Gohu"
          "Hack"
          "Hasklig"
          "HeavyData"
          "Hermit"
          "iA-Writer"
          "IBMPlexMono"
          "Inconsolata"
          "InconsolataGo"
          "InconsolataLGC"
          "Iosevka"
          "IosevkaTerm"
          "JetBrainsMono"
          "Lekton"
          "LiberationMono"
          "Lilex"
          "Meslo"
          "Monofur"
          "Monoid"
          "Mononoki"
          "MPlus"
          "NerdFontsSymbolsOnly"
          "Noto"
          "OpenDyslexic"
          "Overpass"
          "ProFont"
          "ProggyClean"
          "RobotoMono"
          "ShareTechMono"
          "SourceCodePro"
          "SpaceMono"
          "Terminus"
          "Tinos"
          "Ubuntu"
          "UbuntuMono"
          "VictorMono"
        ];
      })
    ];
  };
}
