--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀█ █░█ █░░ █▀▀ █▀
-- ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █▀▄ █▄█ █▄▄ ██▄ ▄█

hl.window_rule({ float = true, match = { class = "blueman-manager" }, center = true, size = { 900, 500 } })
hl.window_rule({ float = true, match = { title = "Network Connections" }, center = true, size = { 900, 500 } })
hl.window_rule({ float = true, match = { title = "Volume Control" }, center = true, size = { 900, 600 } })
hl.window_rule({ float = true, match = { title = "Waypaper" }, center = true, size = { 800, 600 } })
hl.window_rule({ float = true, match = { title = "Zed — Settings" }, center = true, size = { 900, 700 } })

-- Common Dialog Windows
hl.window_rule({
	float = true,
	match = { title = "^(Open.*Files?|Save.*Files?|All Files|Save)$" },
	center = true,
	size = { 700, 500 },
})
hl.window_rule({ float = true, match = { title = "^(Save).*$" }, center = true, size = { 700, 500 } })
hl.window_rule({ float = true, match = { title = "^(Rename|Move).*$" }, center = true, size = "350 100" })

-- Generic dialog windows
hl.window_rule({ float = true, match = { class = "^(.*)[Dd]ialog(.*)$" }, center = true })

-- Common modals
hl.window_rule({ float = true, center = true, match = { title = "^(Confirm to replace files)$" } })
hl.window_rule({ float = true, center = true, match = { title = "^(File Operation Progress)$" } })
hl.window_rule({ float = true, center = true, match = { class = "^(xdg-desktop-portal-gtk)$" } })
hl.window_rule({ float = true, center = true, match = { class = "^(xdg-desktop-portal-hyprland)$" } })
hl.window_rule({ float = true, center = true, match = { title = "^(branchdialog)$" } })
hl.window_rule({ match = { class = ".*" }, persistent_size = true, suppress_event = "maximize" })

hl.window_rule({
	match = { title = "clipse" },
	float = true,
	center = true,
	size = { 652, 700 },
	animation = "slide bottom",
	dim_around = true,
})

-- Workspace assignments
hl.window_rule({ workspace = 1, match = { class = "^(kitty|ghostty)$" } })
hl.window_rule({ workspace = 2, match = { class = "^(zen|brave-browser|google-chrome)$" } })
hl.window_rule({ workspace = 3, match = { class = "^(cursor|neovide|dev.zed.Zed|vscode)$" } })
hl.window_rule({ workspace = 4, match = { class = "^(spotify|obsidian)$" } })
hl.window_rule({ workspace = 5, match = { class = "^(discord)$" } })
hl.window_rule({ workspace = 6, match = { class = "^(pcmanfm)$" } })

hl.layer_rule({
	name = "rofi-popup",
	match = { namespace = "rofi" },
	animation = "slide bottom",
	dim_around = true,
})

hl.layer_rule({
	name = "notification-animations",
	match = { namespace = "swaync-control-center" },
	animation = "slide top",
})
