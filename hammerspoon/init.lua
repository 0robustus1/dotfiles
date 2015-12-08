-- Load Extensions
local application = require "hs.application"
local window      = require "hs.window"
local hotkey      = require "hs.hotkey"
local fnutils     = require "hs.fnutils"
local alert       = require "hs.alert"
local grid        = require "hs.grid"
local spotify     = require "hs.spotify"
local audiodevice = require "hs.audiodevice"
local sound       = require "hs.sound"

local default_sound  = sound.getByName("Hero") -- More sounds in /System/Library/Sounds

-- Set up hotkey combinations
local hit = {"cmd", "ctrl"}
local hits = {"cmd", "ctrl", "shift"}

-- Set grid size.
grid.GRIDWIDTH  = 12
grid.GRIDHEIGHT = 12
grid.MARGINX    = 0
grid.MARGINY    = 0

local function focus_first_valid_window(ordered_wins)
  for _, win in pairs(ordered_wins) do
    win:focus()
    if window.focusedWindow():id() == win:id() then return true end
  end
  return false
end

local function focusnextwindow()
  local app_windows = application.allWindows(window.focusedWindow():application())
  local current_id = window.focusedWindow():id()
  local bigger_windows = fnutils.filter(app_windows, function(win) return (win:id() > current_id) end)
  local smaller_windows = fnutils.filter(app_windows, function(win) return (win:id() < current_id) end)
  table.sort(bigger_windows, function(a, b) return a:id() < b:id() end)
  table.sort(smaller_windows, function(a, b) return a:id() < b:id() end)
  if not focus_first_valid_window(bigger_windows) then
    focus_first_valid_window(smaller_windows)
  end
end

local function increaseVolume(by)
  current_volume = audiodevice.current().volume
  audiodevice.defaultOutputDevice():setVolume(current_volume + by)
end

local function decreaseVolume(by)
  increaseVolume(by * -1)
end

local function applyOne(func, arg)
  return function() func(arg) end
end

hotkey.bind({"ctrl"}, "tab", focusnextwindow)

-- Maximize and Minimize the current window
hotkey.bind(hits, 'M', grid.maximizeWindow)
hotkey.bind(hit, 'M', function() window.focusedWindow():minimize() end)

-- Spotify interaction
hotkey.bind(hits, 'space', spotify.playpause)
hotkey.bind(hits, 'L', spotify.next)
hotkey.bind(hits, 'H', spotify.previous)
-- general audio interaction
hotkey.bind(hits, 'K', applyOne(increaseVolume, 5))
hotkey.bind(hits, 'J', applyOne(decreaseVolume, 5))

-- Focusing other windows
hotkey.bind(hit, 'left',  function() window.focusedWindow():focuswindowWest() end)
hotkey.bind(hit, 'right', function() window.focusedWindow():focuswindowEast() end)
hotkey.bind(hit, 'up',    function() window.focusedWindow():focuswindowNorth() end)
hotkey.bind(hit, 'down',  function() window.focusedWindow():focuswindowSouth() end)

hotkey.bind(hits, 'right', function() window.focusedWindow():moveOneScreenEast() end)
hotkey.bind(hits, 'left', function() window.focusedWindow():moveOneScreenWest() end)

default_sound:play()
alert.show("Mjolnir now rests safely in your hand", 3)
