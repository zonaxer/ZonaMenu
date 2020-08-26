local w, h = GetActiveScreenResolution()
local playerSelected = nil

RMenu.Add('amenu', 'main', RageUI.CreateMenu("Admin Menu", "~b~Menu Principal", tonumber(1300), tonumber(100)))


RMenu.Add('amenu', 'onlineplayers', RageUI.CreateSubMenu(RMenu:Get('amenu', 'main'), "Jugadores Online", "~b~Jugadores Online"))

RMenu.Add('amenu', 'playerview', RageUI.CreateSubMenu(RMenu:Get('amenu', 'onlineplayers'), "Jugador Online", "~b~Jugador:"))


print('--------------------------------------------------------------------------')
local result = IsAceAllowed('command.vmenuclient')
--local result = IsPrincipalAceAllowed('group.helper', 'zMenu.Help')

print(type(result))
print(result)

print('-------------------------------------')

function onlinePlayers() 
    --- List all players
    for _, player in ipairs(GetActivePlayers()) do
        local name = GetPlayerName(player)
        RageUI.Button(string.format("%s - %s", GetPlayerServerId(player), name), "Click para ver las opciones del jugador", {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                playerSelected = GetPlayerServerId(player)
                RMenu:Get('amenu', 'playerview'):SetTitle(name)
                RMenu:Get('amenu', 'playerview'):SetSubtitle(string.format("SERVER ID: %s", playerSelected))
            end
        end, RMenu:Get('amenu', 'playerview'))
        -- do stuff
    end    

end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end


function playerView() 
    --- List all players

    RageUI.Button("Mandar mensaje privado", "Mandas un mensaje privado al jugador.", {}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ShowNotification(string.format('Has seleccionado el id %s', playerSelected))
        end
    end)
    RageUI.Button("Teletransportarse al jugador", "Te teletrasportas donde esta el jugador.", {}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ShowNotification(string.format('Has seleccionado el id %s', playerSelected))
        end
    end)
    RageUI.Button("Teletransportarse al vehiculo del jugador", "Te teletrasportas al vehiculo donde esta el jugador.", {}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ShowNotification(string.format('Has seleccionado el id %s', playerSelected))
        end
    end)
    RageUI.Button("Traer jugador", "Teletrasportas al jugador a donde tu estas.", {}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ShowNotification(string.format('Has seleccionado el id %s', playerSelected))
        end
    end)
    RageUI.Button("Espectar Jugador", "Especteas lo que esta haciendo el jugador", {}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ShowNotification(string.format('Has seleccionado el id %s', playerSelected))
        end
    end)
    RageUI.Button("Activar GPS", "Activa un blip para localizar al jugador.", {}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ShowNotification(string.format('Has seleccionado el id %s', playerSelected))
        end
    end)
    RageUI.Button("Imprimir Identificadores", "Muestra todos los identificadores del jugador activados.", {}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ShowNotification(string.format('Has seleccionado el id %s', playerSelected))
        end
    end)
    RageUI.Button("~r~Matar Jugador", "Le produces un suicido al jugador.", {}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ShowNotification(string.format('Has seleccionado el id %s', playerSelected))
        end
    end)
    RageUI.Button("~r~Kickear Jugador", "Kickeas al jugador", {}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ShowNotification(string.format('Has seleccionado el id %s', playerSelected))
        end
    end)
    RageUI.Button("~r~Ban Temporal", "Baneas al jugador de forma temporal.", {}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ShowNotification(string.format('Has seleccionado el id %s', playerSelected))
        end
    end)
    RageUI.Button("~r~Ban Permanente", "Baneas al jugador de forma permanente.", { LeftBadge = RageUI.BadgeStyle.Alert }, true, function(Hovered, Active, Selected)
        if (Selected) then
            ShowNotification(string.format('Has seleccionado el id %s', playerSelected))
        end
    end)
    

end

RegisterNetEvent('amenu:open')
AddEventHandler('amenu:open', function()
  print("recibo abrir menu")
  RageUI.Visible(RMenu:Get('amenu', 'main'), not RageUI.Visible(RMenu:Get('amenu', 'main')))
  
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        RageUI.IsVisible(RMenu:Get('amenu', 'main'), true, false, true, function()
            -- Button for online players
            RageUI.Button("Jugadores Online", "Muestra todas las personas conectadas actualmente.", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
            end, RMenu:Get('amenu', 'onlineplayers'))

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('amenu', 'onlineplayers'), true, false, true, function()
            onlinePlayers()
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('amenu', 'playerview'), true, false, true, function()
            playerView() 
        end, function()
        end)

        
    end
end)
