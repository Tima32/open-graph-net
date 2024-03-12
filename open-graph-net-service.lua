local event = require("event")
local component = require("component")


local function event_handler(event_name, target, source, port, distance, message_0)
    print(message_0)
    component.computer.beep(300)
end

local function get_my_hostname()
    return os.getenv('HOSTNAME')
end

function start()
    print('start')

    print(get_my_hostname())

    event.listen('modem_message', event_handler)
end

function stop()
    print('stop')
    event.ignore('modem_message', event_handler)
end