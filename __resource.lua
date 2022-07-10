resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

-- Criado por KIKO e zcmg
-- Discord Fredyzaooo#4702 e https://discord.com/invite/Qt5WraEMxf

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server.lua'
}

client_scripts {
	'config.lua',
	'client.lua'
}


dependencies {
	'zcmg_notificacao',
	'mythic_progbar'
}
