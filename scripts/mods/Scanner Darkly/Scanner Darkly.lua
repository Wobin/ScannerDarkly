--[[
Title: Scanner Darkly
Author: Wobin
Date: 17/03/2023
Repository: https://github.com/Wobin/ScannerDarkly
Version:1.0
]]--
local mod = get_mod("Scanner Darkly")
local isScanning = false
local ducked = false
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

mod:hook_safe(CLASS.AuspexScanningEffects, "_stop_searching_sfx_loop", function(self)    
    isScanning = false    
  end)

mod:hook_safe(CLASS.AuspexScanningEffects, "_start_searching_sfx_loop", function(self)    
    isScanning = true
  end)

mod:hook_safe(CLASS.AuspexEffects, "wield", function(self)
    isScanning = true
  end)

mod:hook_safe(CLASS.AuspexEffects, "unwield", function(self)
    isScanning = false    
end)