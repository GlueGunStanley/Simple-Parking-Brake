fx_version "cerulean"
games {'gta5'}

--DO NOT REMOVE THESE
title 'Parking Brake'
description 'A parking brake for all your cars!'
author 'Superzorik'
version 'v1.0.0 RELEASE' --This is required for the version checker, DO NOT change or remove

lua54 "yes"

client_scripts {
    'cl_parkingbrake.lua',
    'cl_config.lua'
}

server_scripts {
    'sv_parkingbrake.lua'
}