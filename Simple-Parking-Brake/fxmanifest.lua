fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Stanley Development Studios'
description 'A simple parking brake script for FiveM'

github 'https://github.com/GlueGunStanley/Simple-Parking-Brake'
discord 'https://discord.com/invite/uCKZJed3Gq'

dependency "baseevents"

client_scripts {
    'config.lua',
    'client/cl_functions.lua',
    'client/cl_main.lua'
}

server_scripts {
    'server/sv_functions.lua',
    'server/sv_main.lua'
}
