-------------------
---- AUTOSTART ----
-------------------

-- █▀▀ ▀▄▀ █▀▀ █▀▀
-- ██▄ █░█ ██▄ █▄▄

hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user import-environment $(env | cut -d'=' -f 1)")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")

	hl.exec_cmd("/usr/lib/xdg-desktop-portal")

	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 22")

	hl.exec_cmd("/usr/lib/soteria-polkit/soteria")

	hl.exec_cmd("awww-daemon && sleep 0.1 && awww restore")

	hl.exec_cmd("waybar")
	-- hl.exec_cmd("swaync")
	hl.exec_cmd("foot --server")
	hl.exec_cmd("clipse -listen")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("udiskie &")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("~/.config/hypr/scripts/power_monitor.sh")
	hl.exec_cmd("hyprpm reload -n")
end)
