<div align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" alt="Catppuccin section border" width="100%" />

  <h1>Arch + Hyprland Dotfiles</h1>
  <p>
    A Catppuccin Mocha themed Arch Linux desktop built around a modular Hyprland setup,
    Waybar, Rofi, wlogout, swaync, foot, kitty, and a small set of daily-driver terminal tools.
  </p>

  <p>
    <a href="https://instagram.com/shubhamm1215">
      <img src="https://img.shields.io/badge/shubhamm1215-%23DDB6F2.svg?style=for-the-badge&color=DDB6F2&label=instagram&labelColor=363a4f&logo=Instagram&logoColor=cad3f5" alt="Instagram badge" />
    </a>
    <a href="https://x.com/codin_nerd">
      <img src="https://img.shields.io/badge/codin_nerd-%23B4BEFE.svg?style=for-the-badge&color=B4BEFE&label=x.com&labelColor=363a4f&logo=x&logoColor=cad3f5" alt="X badge" />
    </a>
    <a href="https://github.com/xshubhamg">
      <img src="https://img.shields.io/badge/xshubhamg-%2312100E.svg?style=for-the-badge&color=A6E3A1&label=github&labelColor=363a4f&logo=GitHub&logoColor=cad3f5" alt="GitHub badge" />
    </a>
    <a href="mailto:shubhammgiri3@gmail.com">
      <img src="https://img.shields.io/badge/shubham-%23EA4335.svg?style=for-the-badge&color=FAB387&label=gmail&labelColor=363a4f&logo=Gmail&logoColor=cad3f5" alt="Gmail badge" />
    </a>
  </p>

  <p>
    <img src="https://skillicons.dev/icons?i=arch,linux,neovim,vim,bash,git,github&theme=dark" alt="Tech icons" />
  </p>
</div>

![Desktop hero](assets/screenshots/hero.png)

## Overview
This repo tracks the desktop environment I actually use on Arch Linux. The Hyprland config is split into small modules for monitors, colors, autostart, rules, plugins, and keybinds, while the rest of the setup carries the same Catppuccin Mocha look through Waybar, Rofi, Kitty, Zed, and fastfetch.

The daily workflow is centered around `foot`, `kitty`, `rofi`, `waypaper`, `wlogout`, `swaync`, `yazi`, `btop`, `hyprshot`, and `satty`, with a few personal app bindings for things like Brave, Zen Browser, Obsidian, and Spotify.

## Screenshots
<table>
  <tr>
    <td width="50%">
      <img src="assets/screenshots/hero.png" alt="Desktop with Waybar and wallpaper" />
      <p align="center"><strong>Hero desktop</strong><br />Wallpaper, Waybar, gaps, rounded corners, and the Catppuccin base palette.</p>
    </td>
    <td width="50%">
      <img src="assets/screenshots/rofi.png" alt="Rofi launcher" />
      <p align="center"><strong>Rofi launcher</strong><br /><code>Super + R</code> opens the themed type-3 launcher.</p>
    </td>
  </tr>
  <tr>
    <td width="50%">
      <img src="assets/screenshots/wlogout.png" alt="wlogout power menu" />
      <p align="center"><strong>wlogout</strong><br /><code>Super + Shift + M</code> opens the power menu for lock, logout, suspend, reboot, and shutdown.</p>
    </td>
    <td width="50%">
      <img src="assets/screenshots/waypaper.png" alt="Waypaper wallpaper picker" />
      <p align="center"><strong>Waypaper</strong><br /><code>Super + W</code> launches the wallpaper picker running with the <code>awww</code> backend.</p>
    </td>
  </tr>
  <tr>
    <td width="50%">
      <img src="assets/screenshots/fastfetch.png" alt="foot terminal running fastfetch" />
      <p align="center"><strong>foot + fastfetch</strong><br />Quick system summary with the custom Arch logo and Nerd Font icons.</p>
    </td>
    <td width="50%">
      <img src="assets/screenshots/notifications.png" alt="Waybar notification area" />
      <p align="center"><strong>Notification integration</strong><br />The Waybar top-right area wired to <code>swaync</code> for notifications and quick toggles.</p>
    </td>
  </tr>
</table>

## Stack
| Area | Tools |
| --- | --- |
| Window manager | Hyprland, hypridle, hyprlock, hyprsunset |
| Status and launchers | Waybar, Rofi, swaync, wlogout |
| Wallpaper and visuals | Waypaper, awww, Bibata cursor, Catppuccin Mocha |
| Terminals and CLI | foot, kitty, Zsh, fastfetch, btop, yazi |
| Editing | Neovim, Zed, Cursor |
| Screenshots and color tools | hyprshot, satty, hyprpicker |

## Hyprland layout
The main config stays small and pulls the desktop together from focused modules:

```text
.config/hypr/
├── hyprland.conf
├── hyprlock.conf
├── hyprsunset.conf
├── scripts/
└── modules/
    ├── animation.conf
    ├── autostart.conf
    ├── colorscheme.conf
    ├── customization.conf
    ├── env.conf
    ├── inputs.conf
    ├── keybinds.conf
    ├── monitors.conf
    ├── plugins.conf
    ├── windowrules.conf
    └── workspacerules.conf
```

That split makes it easy to swap monitor settings, change startup apps, or tweak visuals without digging through one giant config file.

## Featured keybinds
| Keybind | Action |
| --- | --- |
| `Super + Return` | Open `foot` |
| `Super + R` | Open the Rofi launcher |
| `Super + W` | Open Waypaper |
| `Super + Shift + W` | Set a random wallpaper |
| `Super + P` | Launch `btop` in `foot` |
| `Super + Y` | Launch `yazi` in `foot` |
| `Super + Shift + L` | Lock with `hyprlock` |
| `Super + Shift + M` | Open `wlogout` |
| `Print` | Screenshot the output |
| `Super + Print` | Region screenshot piped into `satty` |

For the full set, see `.config/hypr/modules/keybinds.conf`.

## Install
There is no installer script in this repo. The intended setup is: clone it, back up any existing config you already use, then symlink only the directories you want.

```bash
git clone https://github.com/xshubhamg/hypr-dots.git "$HOME/hypr-dots"

mkdir -p "$HOME/.config"

for dir in hypr waybar rofi wlogout kitty fastfetch btop zsh; do
  mv "$HOME/.config/$dir" "$HOME/.config/$dir.bak" 2>/dev/null || true
  ln -snf "$HOME/hypr-dots/.config/$dir" "$HOME/.config/$dir"
done
```

Adjust the list to match the parts of the setup you actually want to use.

## Machine-specific notes
Before using the configs as-is, update the parts that depend on your hardware or home directory:

- `.config/hypr/modules/monitors.conf` sets the monitor layout and scale.
- `.config/hypr/hyprlock.conf` references `/home/xshubhamg/...` paths for the wallpaper and profile image.
- `.config/waypaper/config.ini` points to `~/Pictures/walls` and a local stylesheet path.
- `.config/fastfetch/config.jsonc` references a local logo image in `~/.config/fastfetch/archlinux.png`.
- App bindings in `.config/hypr/modules/keybinds.conf` assume tools like `brave`, `zen-browser`, `obsidian`, `spotify`, `foot`, `kitty`, and `yazi` are installed.

## Fonts and theming
- `JetBrainsMono Nerd Font Mono` is the primary terminal font.
- `Symbols Nerd Font Mono` is used for icon coverage.
- `Poppins` is used in parts of the Hyprland UI.
- The color system is based on Catppuccin Mocha across Hyprland, Waybar, Kitty, and editor theming.

## Credits
- [Catppuccin](https://catppuccin.com/) for the color palette and visual inspiration.
- [Skill Icons](https://skillicons.dev/) and [svgl](https://svgl.app/) for README icon resources.
- [Nerd Fonts](https://www.nerdfonts.com/cheat-sheet) for glyphs used across the setup.
- [Catppuccin Mocha wallpapers](https://github.com/orangci/walls-catppuccin-mocha) if you want a matching wallpaper pack.

<div align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" alt="Catppuccin footer" width="100%" />
</div>
