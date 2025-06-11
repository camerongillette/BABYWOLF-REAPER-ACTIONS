-- Author : BABYWOLF / @babywolfsounds
-- Desc: Adds a vst to the currently selected track with the specificed preset
local VST_NAME="Scheps Omni Channel Stereo"
local PRESET_NAME="muffle"

-- Get the selected track
local track = reaper.GetSelectedTrack(0, 0)


-- Check if a track is selected
if track then
    -- Add the "Scheps Omni Channel" plugin
    local fx_index = reaper.TrackFX_AddByName(track, VST_NAME, false, -1)
    
    -- Check if the plugin was added successfully
    if fx_index ~= -1 then
        -- Set the plugin to the "Muffle" preset
        reaper.TrackFX_SetPreset(track, fx_index, PRESET_NAME)
        
        -- Show plugin window
        reaper.TrackFX_Show(track, fx_index, 2)
    else
        reaper.ShowMessageBox("Failed to add 'Scheps Omni Channel' to the selected track.", "Error", 0)
    end
else
    reaper.ShowMessageBox("No track selected.", "Error", 0)
end