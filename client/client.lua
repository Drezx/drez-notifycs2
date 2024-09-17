local DefaultColor <const> = "#1e7fd4"
local DefaultTime <const> = 3000

---@type function|number
local notifyHandle = 0

local function WaitForHandle()
    while type(notifyHandle) ~= "number" do
        Wait(0)
    end
end

---@param text string
---@param color string?
---@param time number|function?
function Notify(text, color, time)
    WaitForHandle()

    color = (color or DefaultColor)
    notifyHandle = (time or DefaultTime)


    SendNUIMessage({
        action = "hud",
        case = "notify",
        text = text, 
        color = color,
    })
end


RegisterNuiCallback("notifyId", function (data, cb)
    local id = data.id
    local timer = notifyHandle

    notifyHandle = 0

    if type(timer) == "number" then
        Wait(timer)
    else
        timer()
    end

    cb(id)
end)



RegisterNetEvent("Notify", Notify)
exports("Notify", Notify)

Wait(500)
Notify('Test notification', '#1e7fd4', 1500)

Wait(1000)
Notify('~r~Regex ~b~support', 'red', 1500)

-- Wait(1000)

-- Notify('~g~Lorem~y~ ipsum~p~ dolor~s~ sit~b~ amet\n~r~consectetur~c~ adipiscing~w~ elit', 'grey', function ()
--     Wait(3000)
-- end)

-- exports['drez_notifycs2']:Notify('~g~Lorem~y~ ipsum~p~ dolor~s~ sit~b~ amet\n~r~consectetur~c~ adipiscing~w~ elit', 'grey', function ()
--     Wait(3000)
-- end)

-- TriggerEvent('Notify', 'Test Notify', 'red', function ()
--     Wait(800)
-- end)