local mod = get_mod("Scanner Darkly")

return {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
   options = {
      widgets = {         
      {
        setting_id = "scanner_fade",
        type = "numeric",
        range = { 0.01, 0.1 },
        default_value = 0.04,
        decimals_number = 2,
        step_size_value = 0.01,
        change = function(new_value)
            mod:set("scanner_fade", new_value)            
        end,
      },
    }
  }
}
