local event = require("event")
local component = require("component")


local function event_handler(target, source, port, distance, message_0)
    print(message_0)
    component.beep(300)
end

function start()
    print('start')
    event.listen('modem_message', event_handler)
end

function stop()
    print('stop')
    event.ignore('modem_message', event_handler)
end