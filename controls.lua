  local lens_count = 10
  local geo_count = 10

  -- Lens Preset
  table.insert(ctrls, {
    Name = "LensPresetTrigger",
    ControlType = "Button",
    ButtonType = "Trigger",
    UserPin = true,
    PinStyle = "Both",
    Count = lens_count,
  })

  -- Geo page
  table.insert(ctrls, {
    Name = "GeoPresetTrigger",
    ControlType = "Button",
    ButtonType = "Trigger",
    UserPin = true,
    PinStyle = "Both",
    Count = geo_count,
  })

  -- Settings page
  table.insert(ctrls, {
    Name = "Status",
    ControlType = "Indicator",
    IndicatorType = "Status",
    Count = 1
  })
  table.insert(ctrls, {
    Name = "IPAddress",
    ControlType = "Text",
    UserPin = false,
    PinStyle = "None",
    Count = 1,
  })
  table.insert(ctrls, {
    Name = "User",
    ControlType = "Text",
    UserPin = false,
    PinStyle = "None",
    Count = 1,
  })
  table.insert(ctrls, {
    Name = "Pass",
    ControlType = "Text",
    UserPin = false,
    PinStyle = "None",
    Count = 1,
  })
  table.insert(ctrls, {
    Name = "Connect",
    ControlType = "Button",
    ButtonType = "Toggle",
    UserPin = true,
    PinStyle = "Both",
    Count = 1
  })
