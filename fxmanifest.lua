fx_version "cerulean"
games {'gta5'}

--DO NOT REMOVE THESE
title 'Parking Brake'
description 'A parking brake for all your cars!'
author 'Superzorik'
version 'v0.1.0 ALPHA' --This is required for the version checker, DO NOT change or remove

lua54 "yes"

client_scripts {
    'cl_parkingbrake.lua'
}

server_scripts {
    'sv_parkingbrake.lua'
}