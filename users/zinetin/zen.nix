{inputs, pkgs, ...}:

{
  imports = [ 
    inputs.zen-browser.homeModules.beta
  ];
  
  programs.zen-browser = {
    enable = true;

    nativeMessagingHosts = [ pkgs.firefoxpwa ];

    policies = {
      DisableTelemetry = true;
      DisablePocket = true;

      ExtensionSettings = let
        mkExt = shortId: guid: {
          name = guid;
          value = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
            installation_mode = "normal_installed";
          };
        };
      in builtins.listToAttrs [
        (mkExt "ublock-origin" "uBlock0@raymondhill.net")
        (mkExt "darkreader" "addon@darkreader.org")
        (mkExt "youtube-recommended-videos" "myallychou@gmail.com")
        (mkExt "libredirect" "7esoorv3@alefvanoon.anonaddy.me")
        (mkExt "amazon-unsponsor" "{114cc90b-5540-48c1-9009-4090ed2be9fb}")
        (mkExt "videospeed" "{7be2ba16-0f1e-4d93-9ebc-5164397477a9}")
        (mkExt "offline-qr-code-generator" "offline-qr-code@rugk.github.io")
        (mkExt "istilldontcareaboutcookies" "idcac-pub@guus.ninja")
        (mkExt "" "")
      ];
    };

    profiles.default.settings = {
      "extensions.autoDisableScopes" = 0;
      "extensions.pocket.enabled" = false;
    };
  };

  home.packages = [ pkgs.firefoxpwa ];
}
