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

    profiles.default = {
      pins = {
        Blank = {
          id = "941da1a5-91c2-49e7-8783-cdef327ff794";
          url = "about:blank";
          isEssential = true;
          position = 101;
        };

        Monochrome = {
          id = "fd31c3dc-04df-4f69-a45d-c3bc03b12abc";
          url = "https://monochrome.tf";
          isEssential = true;
          position = 102;
        };

        Whatsapp = {
          id = "763bf2b9-061d-4bf5-906c-ed001c404813";
          url = "https://web.whatsapp.com";
          isEssential = true;
          position = 103;
        };

        Silverbullet = {
          id = "f2d4dfa6-5a64-435b-9893-c617cabeb6e9";
          url = "https://silverbullet.zinetin.me";
          isEssential = true;
          position = 104;
        };

        Claude = {
          id = "83669809-4279-480c-998b-cf4cedc0c974";
          url = "https://claude.ai/new";
          isEssential = true;
          position = 105;
        };

        ProtonMail = {
          id = "21615f91-d863-47b3-a298-5d9390989ea7";
          url = "https://mail.proton.me/u/1/inbox";
          isEssential = true;
          position = 106;
        };
      };

      settings = {
        "extensions.autoDisableScopes" = 0;
        "extensions.pocket.enabled" = false;
      };
    };
  };

  home.packages = [ pkgs.firefoxpwa ];
}
