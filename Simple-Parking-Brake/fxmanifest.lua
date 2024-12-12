fx_version 'cerulean'
game 'gta5'
lua54 'yes'

--DO NOT REMOVE THESE
title 'Parking Brake'
description 'A parking brake for all your cars!'
author 'Superzorik'
version 'v1.0.0 RELEASE' --This is required for the version checker, DO NOT change or remove

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
