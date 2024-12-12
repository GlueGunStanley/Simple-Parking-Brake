fx_version "cerulean"
games {'gta5'}

--DO NOT REMOVE THESE
title 'Parking Brake'
description 'A parking brake for all your cars!'
author 'Superzorik'
version 'v1.0.0 RELEASE' --This is required for the version checker, DO NOT change or remove

lua54 "yes"

dependency "baseevents"

client_scripts {
    'config.lua',
    'client/cl_main.lua'
}

server_scripts {
    'server/sv_main.lua'
}
