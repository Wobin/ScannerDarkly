--[[
Title: Scanner Darkly
Author: Wobin
Date: 24/06/2025
Repository: https://github.com/Wobin/ScannerDarkly
]]--
local mod = get_mod("Scanner Darkly")
local isScanning = false
local ducked = false
mod.version = mod.get_metadata and mod:get_metadata("version") or "unknown"

mod.on_all_mods_loaded = function()
   mod:info(mod.version)
end

mod:hook_require("scripts/ui/constant_elements/elements/subtitles/constant_element_subtitles", function(data)    
    mod:hook_safe(data, "update", function(updata)
        if isScanning and not ducked then
          updata:_set_text_opacity(255 * 5 * mod:get("scanner_fade"))
          updata:_set_letterbox_opacity(255 * 5 *  mod:get("scanner_fade"))
          ducked = true          
        end
        if not isScanning and ducked then
          updata:_setup_text_opacity()
          updata:_setup_letterbox()
          ducked = false
        end                  
      end)
    end)

mod:hook_safe(CLASS.AuspexScanningEffects, "_stop_scan_units_effects", function(self)    
    isScanning = false    
  end)

mod:hook_safe(CLASS.AuspexScanningEffects, "_run_searching_sfx_loop", function(self)    
    isScanning = true
  end)

mod:hook_safe(CLASS.AuspexEffects, "wield", function(self)
    isScanning = true
  end)

mod:hook_safe(CLASS.AuspexEffects, "unwield", function(self)
    isScanning = false    
end)