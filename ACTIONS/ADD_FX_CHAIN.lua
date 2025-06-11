-- Author : BABYWOLF / @babywolfsounds
-- Desc: Adds a specified FX chain to the currently selected channel
local fx_chain_name = "PAN POT LFO.RfxChain"
-- Get the selected track
local track = reaper.GetSelectedTrack(0, 0)

-- Check if a track is selected
if track then
    -- Add the FX chain to the track
    local fx_index = reaper.TrackFX_AddByName(track, fx_chain_name, false, -1)
    
    -- Check if the FX chain was successfully added
    if fx_index < 0 then
        reaper.ShowConsoleMsg("Failed to add FX chain '" .. fx_chain_name .. "' to the track.\n")
    end
else
    -- No track selected
    reaper.ShowConsoleMsg("No track selected.\n")
end