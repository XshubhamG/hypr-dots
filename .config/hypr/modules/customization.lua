-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
	general = {
		border_size = 0,
		gaps_in = 5,
		gaps_out = 10,
		resize_on_border = true,
		allow_tearing = true,
		layout = "scrolling",
	},

	decoration = {
		rounding = 5,
		active_opacity = 0.90,
		inactive_opacity = 0.75,

		blur = {
			enabled = true,
			passes = 2,
			size = 8,
			vibrancy = 0.1696,
			new_optimizations = true,
		},
	},

	-- █▀▄▀█ █ █▀ █▀▀
	-- █░▀░█ █ ▄█ █▄▄
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		font_family = "Poppins",
		vrr = 1,
	},

	-- █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀ █▀
	-- █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░ ▄█
	dwindle = {
		preserve_split = true,
	},

	xwayland = {
		force_zero_scaling = true,
	},

	group = {
		groupbar = {
			font_family = "JetBrainsMono Nerd Font",
			font_size = 12,
			gradients = true,
			render_titles = true,
			height = 14,
			stacked = false,
			blur = true,
		},
	},
})
