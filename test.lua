local event         = require("event")
local component     = require("component")
local serialization = require("serialization")

local config_port = 123

local modem = component.modem

-- debud lamp
local lamp_red       = '111110000000000'
local lamp_green     = '000001111100000'
local lamp_blue      = '000000000011111'
local lamp_yelow     = '111111111100000'
local lamp_violet    = '111110000011111'
local lamp_turquoise = '000001111111111'
local lamp_white     = '111111111111111'
local lamp_black     = '000000000000000'
local lamp_gray      = '110001100011000'

local function lamp_set(byte_color)
    if component.colorful_lamp == nil then
        return
    end
    component.colorful_lamp.setLampColor(tonumber(byte_color, 2))
end
lamp_set(lamp_black)

local message = {command='add_me', hostname='test', host_uuid='044b80dc-1234-1234-1234-123456789123'}

modem.broadcast(config_port, serialization.serialize(message))