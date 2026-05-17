local config_dir = os.getenv("HOME") .. "/.config/hypr/modules/"

dofile(config_dir .. "monitors.lua")
dofile(config_dir .. "autostart.lua")
dofile(config_dir .. "env.lua")
dofile(config_dir .. "customization.lua")
dofile(config_dir .. "animation.lua")
dofile(config_dir .. "inputs.lua")
dofile(config_dir .. "keybinds.lua")
dofile(config_dir .. "windowrules.lua")
