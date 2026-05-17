---------------
---- INPUT ----
---------------

-- █ █▄░█ █▀█ █░█ ▀█▀
-- █ █░▀█ █▀▀ █▄█ ░█░

hl.config({
	input = {
		kb_layout = "us",
		repeat_rate = 50,
		repeat_delay = 300,
		follow_mouse = 1,
		sensitivity = 0.5,
		accel_profile = "adaptive",
		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			drag_lock = true,
		},
	},

	cursor = {
		hide_on_key_press = true,
		warp_on_change_workspace = 1,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.gesture({
	fingers = 3,
	direction = "pinchin",
	action = "fullscreen",
})
