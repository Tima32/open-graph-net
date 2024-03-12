local shell = require('shell')

shell.execute('wget -f https://raw.githubusercontent.com/Tima32/open-graph-net/main/open-graph-net-service.lua '..
    '/etc/rc.d/open-graph-net-service.lua')