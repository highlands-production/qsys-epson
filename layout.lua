-- Since our plugin has multiple pages, we need to define some variables to help us dynamically draw the UI based on page and property selections
local CurrentPage = pagenames[props["page_index"].Value] -- This variable can be used to only draw the ctls you want on that page

if CurrentPage == "Lens Preset" then
  local size_pad = 85

	local lens_preset_counts = 10
  for i = 1, lens_preset_counts do
    -- If there is only 1 contorl, it'll be Controls["X"], otherwise Controls["X"][y]... this "solves" that issue; use layout[xxxx]
    local ctl_str = tostring(lens_preset_counts == 1 and "" or " " .. i)
    local left_pad = (size_pad * (i - 1));

    layout["LensPresetTrigger" .. ctl_str] = {
      PrettyName = string.format("Lens~Number %i~Trigger", i),
      Style = "Button",
      ButtonStyle = "Trigger",
      Size = {75, 20},
      Position = {10 + left_pad, 50},
    }
  end
elseif CurrentPage == "Geo Presets" then
  local size_pad = 85

	local geo_preset_counts = 10
  for i = 1, geo_preset_counts do
    -- If there is only 1 contorl, it'll be Controls["X"], otherwise Controls["X"][y]... this "solves" that issue; use layout[xxxx]
    local ctl_str = tostring(geo_preset_counts == 1 and "" or " " .. i)
    local left_pad = (size_pad * (i - 1));

    layout["GeoPresetTrigger" .. ctl_str] = {
      PrettyName = string.format("Geo~Number %i~Trigger", i),
      Style = "Button",
      ButtonStyle = "Trigger",
      Size = {75, 20},
      Position = {10 + left_pad, 50},
    }
  end
elseif CurrentPage == "Settings" then
  layout["IPAddress"] = {
    PrettyName = "IP Address",
    Size = {90, 20},
    Position = {95, 10},
  }
  layout["User"] = {
    PrettyName = "Username",
    Size = {90, 20},
    Position = {95, 40},
  }
  layout["Pass"] = {
    PrettyName = "Password",
    Size = {90, 20},
    Position = {95, 70},
  }
  layout["Connect"] = {
    PrettyName = "Connect",
    Legend = "Connect",
    Size = {90, 20},
    Position = {95, 100},
  }
  layout["Status"] = {
    PrettyName = "Status",
    Size = {90, 20},
    Position = {95, 130},
  }

  graphics = {
    {
      Type = "Text",
      Text = "Host",
      Font = "Roboto",
      FontSize = 10,
      HTextAlign = "Right",
      Color = Colors.Black,
      Position = {10, 10},
      Size = {70, 20}
    },
		{
      Type = "Text",
      Text = "User",
      Font = "Roboto",
      FontSize = 10,
      HTextAlign = "Right",
      Color = Colors.Black,
      Position = {10, 40},
      Size = {70, 20}
    },
		{
      Type = "Text",
      Text = "Pass",
      Font = "Roboto",
      FontSize = 10,
      HTextAlign = "Right",
      Color = Colors.Black,
      Position = {10, 70},
      Size = {70, 20}
    },
    {
      Type = "Text",
      Text = "Status",
      Font = "Roboto",
      FontSize = 10,
      HTextAlign = "Right",
      Color = Colors.Black,
      Position = {10, 130},
      Size = {70, 20}
    },
  }
end
