local event = require("event")

local function event_handler(target, source, port, distance, message_0)
    print(message_0)
end

local function start()
    print('start')
    event.listen('modem_message', event_handler)
end

local function stop()
    print('stop')
end