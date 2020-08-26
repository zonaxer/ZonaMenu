local function OnPlayerConnecting(name, setKickReason, deferrals)
	local player = source
	local clientIdentifier
	local identifiers = GetPlayerIdentifiers(player)
	deferrals.defer()

	-- mandatory wait!
	Wait(0)

	deferrals.update(string.format("Hello %s. Your Steam ID is being checked.", name))

	for _, v in pairs(identifiers) do
		print(v)
			if string.find(v, "license") then
				clientIdentifier = v
				break
			end
	end

	-- mandatory wait!
	Wait(0)

	if not clientIdentifier then
			deferrals.done("You are not connected to Steam.")
	else
			deferrals.done()
	end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)




RegisterCommand("amenu", function(source, args, rawCommand)
	-- If the source is > 0, then that means it must be a player.
	if (source > 0) then
		--TriggerClientEvent('chat:addSuggestion', -1, ('/%s'):format('amenu'), suggestion.help, suggestion.arguments)
		
		--local result =  IsPlayerAceAllowed(source, "zMenu.Dos")
		TriggerClientEvent('amenu:open', source)
		
	else
			print("This command was executed by the server console, RCON client, or a resource.")
	end
end, true)

ExecuteCommand(('add_ace group.%s command.%s allow'):format('helper', 'amenu'))


