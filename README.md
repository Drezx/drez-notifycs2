# FiveM CS2 Inpired notification system
- Standalone
- easy to use

# Showcase
https://youtu.be/sM3WEyoHTbo

# Usage
Drag & Drop drez-notifycs2 to your resource folder
In server cfg type
```
ensure drez-notifycs2
```

```lua

exports['drez_notifycs2']:Notify(text, color, durationFunction)
exports['drez_notifycs2']:Notify('~g~Lorem~y~ ipsum~p~ dolor~s~ sit~b~ amet\n~r~consectetur~c~ adipiscing~w~ elit', 'grey', function ()
    Wait(3000)
end)

TriggerEvent('Notify', text, color, durationFunction)
TriggerEvent('Notify', 'Test Notify', 'red', function ()
    while true do -- Infinite loop! Notify will stay forever
        Wait(1000)
    end
end)
```