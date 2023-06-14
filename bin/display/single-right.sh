#!/bin/bash
#
#
# Show output information:
#   $ kscreen-doctor -o
#   Output: 1 eDP-1 enabled connected Panel Modes: Modes: 1:800x600@60 [...] Geometry: 0,0 1280x800
#   Output: 70 HDMI-2 enabled connected  HDMI Modes: 1:800x600@60 [...] Geometry: 1280,0 1920x1080
#
#   Disable the hdmi output, enable the laptop panel and set it to a specific mode
#   $ kscreen-doctor output.HDMI-2.disable output.eDP-1.mode.1 output.eDP-1.enable
#
#   Position the hdmi monitor on the right of the laptop panel
#   $ kscreen-doctor output.HDMI-2.position.0,1280 output.eDP-1.position.0,0
#
#   Set resolution mode
#   $ kscreen-doctor output.HDMI-2.mode.1920x1080@60
#
#   Set scale (note: fractional scaling is only supported on wayland)
#   $ kscreen-doctor output.HDMI-2.scale.2
#
#   Set rotation (possible values: none, left, right, inverted)
#   $ kscreen-doctor output.HDMI-2.rotation.left
#
# kscreen-doctor -o
# Output: 1 DP-1 disabled connected priority 0 DisplayPort Modes: 0:2560x1440@60! 1:2560x1440@144* 2:2560x1440@120 3:2560x1440@100 4:2560x1440@85 5:2560x1440@24 6:1920x1200@60 7:1920x1080@60 8:1600x1200@60 9:1680x1050@60 10:1280x1024@60 11:1440x900@60 12:1280x800@60 13:1280x720@60 14:1024x768@60 15:800x600@60 16:640x480@60 17:640x480@60 18:1600x1200@60 19:1280x1024@60 20:1024x768@60 21:1920x1200@60 22:1280x800@60 23:2560x1440@60 24:1920x1080@60 25:1600x900@60 26:1368x768@60 27:1280x720@60 Geometry: 3072,0 2560x1440 Scale: 1 Rotation: 1 Overscan: 0 Vrr: incapable RgbRange: unknown
# Output: 2 HDMI-A-1 enabled connected priority 1 HDMI Modes: 0:3840x2160@60*! 1:3840x2160@60 2:3840x2160@60 3:3840x2160@30 4:3840x2160@30 5:3840x2160@25 6:3840x2160@24 7:3840x2160@24 8:2560x1440@60 9:2048x1280@60 10:1920x1200@60 11:1920x1080@60 12:1920x1080@60 13:1920x1080@60 14:1920x1080@50 15:1920x1080@25 16:1920x1080@24 17:1920x1080@24 18:1600x1200@60 19:1680x1050@60 20:1600x900@60 21:1280x1024@75 22:1280x1024@60 23:1440x900@60 24:1280x800@60 25:1152x864@75 26:1280x720@60 27:1280x720@60 28:1280x720@50 29:1024x768@75 30:1024x768@60 31:800x600@75 32:800x600@60 33:720x576@50 34:720x576@50 35:720x480@60 36:720x480@60 37:720x480@60 38:720x480@60 39:640x480@75 40:640x480@60 41:640x480@60 42:640x480@60 43:720x400@70 44:1600x1200@60 45:1280x1024@60 46:1024x768@60 47:2560x1600@60 48:1920x1200@60 49:1280x800@60 50:3840x2160@60 51:3200x1800@60 52:2880x1620@60 53:2560x1440@60 54:1920x1080@60 55:1600x900@60 56:1368x768@60 57:1280x720@60 Geometry: 0,0 3072x1728 Scale: 1.25 Rotation: 1 Overscan: 0 Vrr: Never RgbRange: unknown


kscreen-doctor \
    output.DP-1.disable \
    output.DP-2.disable \
    output.HDMI-A-1.enable \
    output.HDMI-A-1.priority.1 \
    output.HDMI-A-1.mode.0 \
    output.HDMI-A-1.scale.1.25 \
    output.HDMI-A-1.rotation.none
