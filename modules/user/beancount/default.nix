{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.cv.beancount;
in {
  options.cv.beancount.enable = mkOption {
    description = "Enable beancount";
    type = types.bool;
    default = false;
  };

  config = mkIf (cfg.enable) {
    home.packages = with pkgs; [
      beancount
      beancount-black
      beancount-language-server
      fava
    ];
  };
}
