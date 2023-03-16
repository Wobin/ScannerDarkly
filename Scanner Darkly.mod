return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`Scanner Darkly` encountered an error loading the Darktide Mod Framework.")

		new_mod("Scanner Darkly", {
			mod_script       = "Scanner Darkly/scripts/mods/Scanner Darkly/Scanner Darkly",
			mod_data         = "Scanner Darkly/scripts/mods/Scanner Darkly/Scanner Darkly_data",
			mod_localization = "Scanner Darkly/scripts/mods/Scanner Darkly/Scanner Darkly_localization",
		})
	end,
	packages = {},
}
