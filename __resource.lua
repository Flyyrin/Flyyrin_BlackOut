fx_version 'adamant'
games 'gta5'

author 'Flyyrin'
description 'Allows players to cut out power.'
version '1.0.0'

client_scripts {
    'client/main.lua',
    'client/functions.lua',
}

server_script {
    'server.lua',
    '@vSync-Flyyrin_BlackOut/vs_server.lua'
}

shared_script {
    'config.lua',
}