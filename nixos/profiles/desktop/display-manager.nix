{config, pkgs, lib, ...}:

let
  sddm-astronaut = (pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
  });
in 
{
  environment.systemPackages = [
    sddm-astronaut
  ];

  services.desktopManager.plasma6.enable = config.desktop == "plasma";
  services.desktopManager.cosmic.enable = config.desktop == "cosmic";

  services = {
    xserver.enable = true;
    xserver.desktopManager.cinnamon.enable = config.desktop == "cinnamon";
  }

# Hopefully get rid of animations in cosmic
  nixpkgs.overlays = [
    (final: prev: {
     cosmic-comp = prev.cosmic-comp.overrideAttrs (oldAttrs: {
         postPatch = ''
         ${oldAttrs.postPatch or ""}
         find src/shell -type f -name "*.rs" -exec sed -i \
         's/Duration::from_millis([0-9]\+)/Duration::from_millis(1)/g' {} \;
         sed -i 's/pub const SSD_HEIGHT: i32 = 36;/pub const SSD_HEIGHT: i32 = 0;/g' \
         src/shell/element/window.rs
         '';
         });
     })
  ];

  programs = {
#    hyprland.enable = true;

#    halley = {
#      enable = true;
#      package = inputs.halley.packages.${pkgs.system}.halley-unstable;
#    };

    iridium.enable = config.desktop == "iridium";
  };



  services.displayManager = {
    cosmic-greeter.enable = config.desktop == "cosmic";
    sddm = {
      enable = !(lib.elem config.desktop ["cosmic"]);
      wayland.enable = true;
      extraPackages = with pkgs; [
        kdePackages.qtmultimedia
      ];
      theme = "sddm-astronaut-theme";
    };
  };

#  services.displayManager.ly = {
#    enable = true;
#
#    settings = {
#      animation = "dur_file";
#
#      animation_frame_delay = 50;
#
#      dur_file_path = toString ./blackhole-smooth-240x67.dur;
#
#      dur_offset_alignment = "center";
#
#      full_color = true;
#
#      save = true;
#      
#      load = true;
#    };
#  };
}
