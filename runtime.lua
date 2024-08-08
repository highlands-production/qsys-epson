--[[ Runtime File Contents ]]

local config = {}
local debug = {
  Connection = true
}

-------- QSys Code
function start()
  if Controls.Connect.Value == 1 then
    if debug.Connection then print ("Starting the connection...") end
    disableConConfig(true)

    config = {
      base_url = Controls.IPAddress.String,
      username = Controls.User.String,
      password = Controls.Pass.String,
      qsys = true,
      debug = debug.Connection
    }
  else
    if debug.Connection then print ("Stopping the connection...") end
    disableConConfig(false)
  end
end

function disableConConfig(disabled)
  Controls.IPAddress.IsDisabled = disabled
  Controls.User.IsDisabled = disabled
  Controls.Pass.IsDisabled = disabled
  Controls.Connect.Legend = disabled and "Disconnect" or "Connect"
end

local status_states = {
  OK = 0,
  COMPROMISED = 1,
  FAULT = 2,
  NOTPRESENT = 3,
  MISSING = 4,
  INITIALIZING = 5
}

function setStatus(key, message)
  Controls.Status.Value = status_states[key]
  Controls.Status.String = message == nil and "" or message
end

function watchBtns()
	for i, v in ipairs(Controls["GeoPresetTrigger"]) do
		v.EventHandler = function()
			EpsonPjCommander.recallGeoPreset(i)
		end
	end

	for i, v in ipairs(Controls["LensPresetTrigger"]) do
		v.EventHandler = function()
			EpsonPjCommander.recallLensPreset(i)
		end
	end
end

--------- core code

--[[ #include "core.lua" ]]

Controls.Connect.EventHandler = start
watchBtns()
start()
