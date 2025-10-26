fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Pinguim Scripts'
description 'Evento de Halloween - Doces ou Travessuras (Multilingue)'
version '1.2.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
'server.lua',
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'data/.swc.config.js',
}

files {
    'locales/pt.json',
    'locales/en.json'
}

dependencies {
    'ox_target',
    'ox_lib',
    'oxmysql',
    'mt_lib'
}
