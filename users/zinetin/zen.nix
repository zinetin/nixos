{inputs, pkgs, lib, ...}:

let
  extension = shortId: guid: {
    name = guid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "normal_installed";
    };
  };

  prefs = {
    "extensions.autoDisableScopes" = 0;
    "extensions.pocked.enabled" = false;
  };

  extensions = [
    (extension "ublock-origin" "uBlock0@raymondhill.net")
    (extension "darkreader" "addon@darkreader.org")
    (extension "youtube-recommended-videos" "myallychou@gmail.com")
    (extension "libredirect" "7esoorv3@alefvanoon.anonaddy.me")
    (extension "amazon-unsponsor" "{114cc90b-5540-48c1-9009-4090ed2be9fb}")
    (extension "videospeed" "{7be2ba16-0f1e-4d93-9ebc-5164397477a9}")
    (extension "" "")
  ];
in 
{
  home.packages = [
    (pkgs.wrapFirefox
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped
      {
        extraPrefs = lib.concatLines (
          lib.mapAttrsToList (
            name: value: ''lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});''
          ) prefs
        );

        extraPolicies = {
          DisableTelemetry = true;
          ExtensionSettings = builtins.listToAttrs extensions;

          SearchEngines = {
            Default = "google";
          };
        };
      }
    )
  ];
}
