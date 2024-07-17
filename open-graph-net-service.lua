local event         = require("event")
local component     = require("component")
local serialization = require("serialization")

local config_port = 123

-- debud lamp
local lamp_red       = '111110000000000'
local lamp_green     = '000001111100000'
local lamp_blue      = '000000000011111'
local lamp_yelow     = '111111111100000'
local lamp_violet    = '111110000011111'
local lamp_turquoise = '000001111111111'
local lamp_white     = '111111111111111'
local lamp_black     = '000000000000000'

local function lamp_set(byte_color)
    if component.colorful_lamp == nil then
        return
    end
    component.colorful_lamp.setLampColor(tonumber(byte_color, 2))
end


-- format --
-- {command='add_me', hostname='name', hostu_uid='044b80dc-1234-1234-1234-123456789123'}
-- {command='add_me_andswer, status='status='status'}

local function command_add_me_request()
    lamp_set(lamp_green)

    local answer = {command='add_me_answer', status='test'}
    modem.broadcast(config_port, serialization.serialize(answer))
end
local function command_add_me_answer()
    lamp_set(lamp_white)
end


local function event_handler(event_name, target, source, port, distance, message_0)
    local table = serialization.unserialize(message_0)
    if table == nil then return end

    local command = table['command']
    if command == nil then return end

    if command == 'add_me' then
        command_add_me_request()
    elseif command == 'add_me_answer' then
        command_add_me_answer()
    else
        lamp_set(lamp_black)
    end

end

local function get_my_hostname()
    return os.getenv('HOSTNAME')
end

-- service command
function start()
    print('start')
    print(get_my_hostname())
    component.modem.open(config_port)

    event.listen('modem_message', event_handler)
end

function stop()
    print('stop')
    event.ignore('modem_message', event_handler)
end