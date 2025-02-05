# i3.nix

{ pkgs, lib, config, ... }: {

    home.directory."$HOME/.config/i3".source = ./../i3;

    home.packages = with pkgs; [
            feh
            rofi
            rofi-calc
            (nerdfonts.override { fonts = ["JetBrainsMono"]; })
            # nerdfonts.jetbrains-mono
    ];
                            }
