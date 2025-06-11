-- Author : BABYWOLF / @babywolfsounds
-- Desc: Adds the OneKnob Filter vst, creates an automation lane for the cutoff preset and creates an envelope point

local track = reaper.GetSelectedTrack(0, 0)

-- Check if a track is selected
if track then
    
    -- Add the "Scheps Omni Channel" plugin
    local fx_index = reaper.TrackFX_AddByName(track, "OneKnob Filter Stereo", false, -1)
    
    -- Check if the plugin was added successfully
    if fx_index ~= -1 then
        -- Get the index of the last FX in the chain
        local num_fx = reaper.TrackFX_GetCount(track)
        local last_fx_index = num_fx - 1
        -- reaper.ShowConsoleMsg(last_fx_index)
        
        -- Check if there is at least one FX on the track
        if num_fx > 0 then
          -- Create a new envelope for the 'filter' parameter
          local envelope = reaper.GetFXEnvelope(track, fx_index, 2, true)
          
          if envelope then
              -- Insert a new automation point at time = 0.0, value = 0.5
              reaper.InsertEnvelopePointEx(
                  envelope,
                  -1,         -- take envelope (for items), -1 means project envelope
                  0.0,        -- time in seconds
                  1,        -- value (0.0 - 1.0)
                  0,          -- shape (0 = linear)
                  0,          -- tension (not used for linear)
                  false,      -- selected
                  true        -- noSort false = sort after inserting
              )
              reaper.Envelope_SortPoints(envelope)
              end
          end
        else
          -- The track has no FX
          reaper.ShowConsoleMsg("The track has no FX.\n")
        end
        
    else
        reaper.ShowMessageBox("Failed to add 'filter' to the selected track.", "Error", 0)
    end

