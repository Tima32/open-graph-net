local event         = require("event")
local component     = require("component")
local serialization = require("serialization")

local config_port = 123

local modem = component.modem


local message = {command='add_me', hostname='test', host_uuid='044b80dc-1234-1234-1234-123456789123'}

modem.broadcast(config_port, serialization.serialize(message))