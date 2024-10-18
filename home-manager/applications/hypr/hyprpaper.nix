{ ... }: 
let 
  image = "~/.config/nixos-config/home-manager/wallpapers/wallpaper.jpg";
in
{
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    ipc = "on";
    splash = false;
    splash_offset = 2.0;

    preload = [
      image
    ];

    wallpaper = [",${image}"];
  };

}
