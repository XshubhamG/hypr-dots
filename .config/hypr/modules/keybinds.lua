---------------------
---- MY PROGRAMS ----
---------------------

local code = "zeditor"
local browser = "brave"
local lock = "hyprlock"
local zen = "zen-browser"
local wallpaper = "waypaper"
local fileManager = "pcmanfm"
local notes = "obsidian --ozone-platform=wayland"
local spotify = "spotify --ozone-platform=wayland"
local foot = "footclient -e tmux new-session -A -s 'Home 󰣇'"
local terminal = "ghostty"
local random_wall = "waypaper --random --folder ~/Pictures/walls --backend awww"

---------------------
---- KEYBINDINGS ----
---------------------

-- █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄
-- █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local secondMod = "SUPER" .. " + SHIFT"

-- Basic apps
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(code))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(secondMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(notes))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/rofi/application/launcher.sh"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("footclient -T clipse -e 'clipse'"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(wallpaper))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(zen))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))

-- Utilities
hl.bind(secondMod .. " + B", hl.dsp.exec_cmd("pkill -x waybar || waybar &"))
hl.bind(secondMod .. " + W", hl.dsp.exec_cmd(random_wall))
hl.bind(secondMod .. " + P", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(secondMod .. " + L", hl.dsp.exec_cmd(lock))
hl.bind(secondMod .. " + M", hl.dsp.exec_cmd("wlogout -b 5"))
hl.bind(secondMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(secondMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))

hl.bind("ALT + M", hl.dsp.exec_cmd(spotify))

-- Scratchpad
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.window.move({ workspace = "special:scratchpad", silent = true }))

-- Screenshots
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m output -m eDP-1"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region --raw | satty --filename -"))
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m window"))

-- Window Focus (Vim keys)
-- █▀▀ █▀█ █▀▀ █░█ █▀
-- █▀░ █▄█ █▄▄ █▄█ ▄█
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Move Windows
-- █▀▄▀█ █▀█ █░█ █▀▀
-- █░▀░█ █▄█ ▀▄▀ ██▄
hl.bind(secondMod .. " + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(secondMod .. " + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(secondMod .. " + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(secondMod .. " + L", hl.dsp.window.move({ direction = "right" }))

-- Resize Windows
-- █▀█ █▀▀ █▀ █ ▀█ █▀▀
-- █▀▄ ██▄ ▄█ █ █▄ ██▄
-- hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({ size = "-20 0" }))
-- hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ size = "0 20" }))
-- hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ size = "0 -20" }))
-- hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ size = "20 0" }))

-- Workspace Switching
-- █▀ █░█░█ █ ▀█▀ █▀▀ █░█
-- ▄█ ▀▄▀▄▀ █ ░█░ █▄▄ █▀█
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(secondMod .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Multimedia Keys
-- █▀▄▀█ █░█ █░░ ▀█▀ █ █▀▄▀█ █▀▀ █▀▄ █ ▄▀█
-- █░▀░█ █▄█ █▄▄ ░█░ █ █░▀░█ ██▄ █▄▀ █ █▀█
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true })
hl.bind("xf86monbrightnessup", hl.dsp.exec_cmd("brightnessctl set 5%+"), { repeating = true })
hl.bind("xf86monbrightnessdown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })

-- Mouse Bindings
hl.bind("ALT + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("ALT + mouse:272", hl.dsp.window.float({ action = "toggle" }), { mouse = true, click = true })
hl.bind("ALT + CTRL + mouse:272", hl.dsp.window.resize(), { mouse = true, drag = true })

-- Hyprscrolling / Layout Messages
hl.bind(mainMod .. " + period", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + comma", hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + F", hl.dsp.layout("colresize 1.0"))
hl.bind(mainMod .. " + P", hl.dsp.layout("promote"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.layout("colresize +conf"))

-- Groups
hl.bind(mainMod .. " + G", hl.dsp.layout("togglegroup"))
hl.bind(mainMod .. " + TAB", hl.dsp.layout("changegroupactive f"))
hl.bind(secondMod .. " + TAB", hl.dsp.layout("changegroupactive b"))
hl.bind(secondMod .. " + G", hl.dsp.layout("moveoutofgroup"))
