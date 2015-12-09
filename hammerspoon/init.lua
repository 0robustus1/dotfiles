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

-- Focus the first window in the ordered list of windows that is not the
-- currently focused window and can actually be successfully focused.
local function focus_first_valid_window(ordered_wins)
  for _, win in pairs(ordered_wins) do
    win:focus()
    if window.focusedWindow():id() == win:id() then return true end
  end
  return false
end

-- determines the next and previous windows in all windows of the current
-- application.  After that it first tries to select the first valid of the
-- 'next' windows and if that fails the first valid of the 'previous' windows.
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

-- promise to call function with provided arguments when realized
local function promise(func, ...)
  local args={...}
  return function() func(table.unpack(args)) end
end

-- promise to call function on the then focused window
local function onFocused(func)
  return function() func(window.focusedWindow()) end
end

local function moveToNextScreen(win)
  win = win or window.focusedWindow()
  win:moveToScreen(win:screen():next())
end

local function moveToPreviousScreen(win)
  win = win or window.focusedWindow()
  win:moveToScreen(win:screen():previous())
end

-- Reload hammerspoon config
hotkey.bind({"cmd", "shift"}, "R", hs.reload)

-- Focus the next window of the current application
hotkey.bind({"ctrl"}, "tab", focusnextwindow)

-- Maximize and Minimize the current window
hotkey.bind(hits, 'M', grid.maximizeWindow)
hotkey.bind(hit, 'M', onFocused(window.minimize))

-- spawn or focus applications
hotkey.bind(hits, "T", promise(application.launchOrFocus, "iTerm"))

-- Spotify interaction
hotkey.bind(hits, 'space', spotify.playpause)
hotkey.bind(hits, 'L', spotify.next)
hotkey.bind(hits, 'H', spotify.previous)
-- general audio interaction
hotkey.bind(hits, 'K', promise(increaseVolume, 5))
hotkey.bind(hits, 'J', promise(decreaseVolume, 5))

-- Focusing other windows
hotkey.bind(hit, 'left',  onFocused(window.focusWindowWest))
hotkey.bind(hit, 'right', onFocused(window.focusWindowEast))
hotkey.bind(hit, 'up',    onFocused(window.focusWindowNorth))
hotkey.bind(hit, 'down',  onFocused(window.focusWindowSouth))

-- Move current window to next/previous screen
-- hotkey.bind(hits, 'right', onFocused(window.moveOneScreenEast))
-- hotkey.bind(hits, 'left', onFocused(window.moveOneScreenWest))
hotkey.bind(hits, 'right', moveToNextScreen)
hotkey.bind(hits, 'left', moveToPreviousScreen)

-- Startup notification stuff
default_sound:play()
alert.show("Mjolnir now rests safely in your hand", 3)
