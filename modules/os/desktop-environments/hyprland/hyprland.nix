{config, ...}: let
  inherit (config.maios.os.desktop-environments.hyprland) enable keyboard-layout extra-monitor-settings;
in {
  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];

  programs = {
    hyprland.enable = enable;
    dconf.enable = enable;
    seahorse.enable = enable;
    fuse.userAllowOther = enable;
    mtr.enable = enable;
    adb.enable = enable;
    gnupg.agent = {
      inherit enable;
      enableSSHSupport = enable;
    };
  };

  wayland.windowManager.hyprland = {
    inherit enable;
    withUWSM = true;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = ["--all"];
    };
    xwayland = {
      enable = true;
    };
    settings = {
      exec-once = [
        "wl-clip-persist --clipboard regular"
        "wl-paste --type text --watch cliphist store # Stores only text data"
        "wl-paste --type image --watch cliphist store # Stores only image data"
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user start hyprpolkitagent"
        "killall -q waybar;sleep .5 && waybar"
        "killall -q swaync;sleep .5 && swaync"
        "nm-applet --indicator"
      ];

      input = {
        kb_layout = "${keyboard-layout}";
        kb_options = [
          "grp:alt_caps_toggle"
          "caps:super"
        ];
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 1;
        float_switch_override_focus = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
          disable_while_typing = true;
          scroll_factor = 0.8;
          tap-to-click = false;
        };
      };

      gestures = {
        workspace_swipe = 1;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 500;
        workspace_swipe_invert = 1;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = 1;
        workspace_swipe_forever = 1;
      };

      general = {
        "$modifi fe feer" = "SUPER";
        layout = "dwindle";
        gaps_in = 6;
        gaps_out = 8;
        border_size = 2;
        resize_on_border = true;
        "col.active_border" = "rgb(${config.lib.stylix.colors.base08}) rgb(${config.lib.stylix.colors.base0C}) 45deg";
        "col.inactive_border" = "rgb(${config.lib.stylix.colors.base01})";
      };

      misc = {
        layers_hog_keyboard_focus = true;
        initial_workspace_tracking = 0;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = false;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = false;
        vfr = true; # Variable Frame Rate
        vrr = 2; #Variable Refresh Rate  Might need to set to 0 for NVIDIA/AQ_DRM_DEVICES
        # Screen flashing to black momentarily or going black when app is fullscreen
        # Try setting vrr to 0
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          ignore_opacity = false;
          new_optimizations = true;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      cursor = {
        sync_gsettings_theme = true;
        no_hardware_cursors = 2; # change to 1 if want to disable
        enable_hyprcursor = false;
        warp_on_change_workspace = 2;
        no_warps = true;
      };

      render = {
        explicit_sync = 1; # Change to 1 to disable
        explicit_sync_kms = 1;
        direct_scanout = 0;
      };

      master = {
        new_status = "master";
        new_on_top = 1;
        mfact = 0.5;
      };

      env = [
        "NIXOS_OZONE_WL, 1"
        "NIXPKGS_ALLOW_UNFREE, 1"
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "GDK_BACKEND, wayland, x11"
        "CLUTTER_BACKEND, wayland"
        "QT_QPA_PLATFORM=wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "SDL_VIDEODRIVER, x11"
        "MOZ_ENABLE_WAYLAND, 1"
        "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
        "GDK_SCALE,1"
        "QT_SCALE_FACTOR,1"
      ];
    };

    wayland.windowManager.hyprland = {
      settings = {
        windowrulev2 = [
          "tag +file-manager, class:^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$"
          "tag +terminal, class:^(com.mitchellh.ghostty|org.wezfurlong.wezterm|Alacritty|kitty|kitty-dropterm)$"
          "tag +browser, class:^(Brave-browser(-beta|-dev|-unstable)?)$"
          "tag +browser, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$"
          "tag +browser, class:^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$"
          "tag +browser, class:^([Tt]horium-browser|[Cc]achy-browser)$"
          "tag +projects, class:^(codium|codium-url-handler|VSCodium)$"
          "tag +projects, class:^(VSCode|code-url-handler)$"
          "tag +im, class:^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$"
          "tag +im, class:^([Ff]erdium)$"
          "tag +im, class:^([Ww]hatsapp-for-linux)$"
          "tag +im, class:^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$"
          "tag +im, class:^(teams-for-linux)$"
          "tag +games, class:^(gamescope)$"
          "tag +games, class:^(steam_app_\d+)$"
          "tag +gamestore, class:^([Ss]team)$"
          "tag +gamestore, title:^([Ll]utris)$"
          "tag +gamestore, class:^(com.heroicgameslauncher.hgl)$"
          "tag +settings, class:^(gnome-disks|wihotspot(-gui)?)$"
          "tag +settings, class:^([Rr]ofi)$"
          "tag +settings, class:^(file-roller|org.gnome.FileRoller)$"
          "tag +settings, class:^(nm-applet|nm-connection-editor|blueman-manager)$"
          "tag +settings, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
          "tag +settings, class:^(nwg-look|qt5ct|qt6ct|[Yy]ad)$"
          "tag +settings, class:(xdg-desktop-portal-gtk)"
          "tag +settings, class:(.blueman-manager-wrapped)"
          "tag +settings, class:(nwg-displays)"
          "move 72% 7%,title:^(Picture-in-Picture)$"
          "center, class:^([Ff]erdium)$"
          "float, class:^([Ww]aypaper)$"
          "center, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
          "center, class:([Tt]hunar), title:negative:(.*[Tt]hunar.*)"
          "center, title:^(Authentication Required)$"
          "idleinhibit fullscreen, class:^(*)$"
          "idleinhibit fullscreen, title:^(*)$"
          "idleinhibit fullscreen, fullscreen:1"
          "float, tag:settings*"
          "float, class:^([Ff]erdium)$"
          "float, title:^(Picture-in-Picture)$"
          "float, class:^(mpv|com.github.rafostar.Clapper)$"
          "float, title:^(Authentication Required)$"
          "float, class:(codium|codium-url-handler|VSCodium), title:negative:(.*codium.*|.*VSCodium.*)"
          "float, class:^(com.heroicgameslauncher.hgl)$, title:negative:(Heroic Games Launcher)"
          "float, class:^([Ss]team)$, title:negative:^([Ss]team)$"
          "float, class:([Tt]hunar), title:negative:(.*[Tt]hunar.*)"
          "float, initialTitle:(Add Folder to Workspace)"
          "float, initialTitle:(Open Files)"
          "float, initialTitle:(wants to save)"
          "size 70% 60%, initialTitle:(Open Files)"
          "size 70% 60%, initialTitle:(Add Folder to Workspace)"
          "size 70% 70%, tag:settings*"
          "size 60% 70%, class:^([Ff]erdium)$"
          "opacity 1.0 1.0, tag:browser*"
          "opacity 0.9 0.8, tag:projects*"
          "opacity 0.94 0.86, tag:im*"
          "opacity 0.9 0.8, tag:file-manager*"
          "opacity 0.8 0.7, tag:terminal*"
          "opacity 0.8 0.7, tag:settings*"
          "opacity 0.8 0.7, class:^(gedit|org.gnome.TextEditor|mousepad)$"
          "opacity 0.9 0.8, class:^(seahorse)$ # gnome-keyring gui"
          "opacity 0.95 0.75, title:^(Picture-in-Picture)$"
          "pin, title:^(Picture-in-Picture)$"
          "keepaspectratio, title:^(Picture-in-Picture)$"
          "noblur, tag:games*"
          "fullscreen, tag:games*"
        ];
      };

      extraConfig = "
      monitor=,preferred,auto,auto
      ${extra-monitor-settings}
    ";
    };
  };
}
