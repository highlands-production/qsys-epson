EpsonPjCommander = {
    TIMEOUT = 3
}

function EpsonPjCommander.recallGeoPreset(number)
	EpsonPjCommander.makeRequest('/cgi-bin/directsend?POPGC=' .. string.format("%02d", number))
end

function EpsonPjCommander.recallLensPreset(number)
	EpsonPjCommander.makeRequest('/cgi-bin/directsend?POPLP=' .. string.format("%02d", number))
end

function EpsonPjCommander.makeRequest(params)
    local url = 'https://' .. config.base_url .. '/' .. params

    if config.debug then print(url) end

		local request = {
			Url = url,
			User = config.username,
			Password = config.password,
			Auth = "digest",
			Headers = {
				["Referer"] = 'https://' .. config.base_url,
			},
			Timeout = EpsonPjCommander.TIMEOUT,
			EventHandler = function(table, code, data, errorz, headers)
				print ("Returned: " .. code)
			end
		}

		HttpClient.Download(request)
end
