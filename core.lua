EpsonPjCommander = {
    TIMEOUT = 3
}

function EpsonPjCommander.recallGeoPreset(number)
	EpsonPjCommander.escvp21Command('POPGC', string.format("%02d", number))
end

function EpsonPjCommander.recallLensPreset(number)
	EpsonPjCommander.escvp21Command('POPLP', string.format("%02d", number))
end

function EpsonPjCommander.escvp21Command(cmd, value)
	EpsonPjCommander.makeRequest('api/v01/control/escvp21?cmd=' .. cmd .. '+' .. value)
end

function EpsonPjCommander.makeRequest(path)
    local url = 'https://' .. config.base_url .. '/' .. path .. '&_=' .. os.time()

    if config.debug then print(url) end
		local request = {
			Url = url,
			User = config.username,
			Password = config.password,
			Auth = "digest",
			Timeout = EpsonPjCommander.TIMEOUT,
			EventHandler = function(table, code, data, errorz, headers)
				print ("Returned: " .. code)
			end
		}

		HttpClient.Download(request)
end
