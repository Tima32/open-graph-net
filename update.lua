local fs = require('filesystem')

local shell = require('shell')

local result, reason = fs.makeDirectory('/home/ogn')
shell.execute('wget -f https://raw.githubusercontent.com/Tima32/open-graph-net/main/update.lua '..
    '/home/ogn/update.lua')
shell.execute('wget -f https://raw.githubusercontent.com/Tima32/open-graph-net/main/open-graph-net-service.lua '..
    '/home/ogn/open-graph-net-service.lua')