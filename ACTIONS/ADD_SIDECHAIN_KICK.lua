-- Author : BABYWOLF / @babywolfsounds
-- Desc: Add Kick send + MCompressor with Sidechain preset

-- Step 1: Get currently selected track
local selectedTrack = reaper.GetSelectedTrack(0, 0)
if not selectedTrack then
  reaper.ShowMessageBox("No track selected!", "Error", 0)
  return
end

local kickTrack = nil
local trackCount = reaper.CountTracks(0)
for i = 0, trackCount - 1 do
  local track = reaper.GetTrack(0, i)
  local _, name = reaper.GetSetMediaTrackInfo_String(track, "P_NAME", "", false)
  if name == "Kick" or name == "kick" then
    kickTrack = track
    break
  end
end

if not kickTrack then
  reaper.ShowMessageBox("Track named 'Kick' not found!", "Error", 0)
  return
end

-- Step 3: Create the send from Kick → selectedTrack on channels 3/4
local sendIndex = reaper.CreateTrackSend(kickTrack, selectedTrack)
reaper.SetTrackSendInfo_Value(kickTrack, 0, sendIndex, "I_DSTCHAN", 2) -- 2 = channels 3/4
-- UPDATE 'MCompressor' to whatever compressor you want to use
local fxIndex = reaper.TrackFX_AddByName(selectedTrack, "MCompressor (MeldaProduction)", false, -1)

--  Load "Side-chain" preset (must match exact preset name installed), otherwise will use default preset
reaper.TrackFX_SetPreset(selectedTrack, fxIndex, "Side-chain")