fx_version 'bodacius'
game 'gta5'

client_script {
	"@vrp/lib/utils.lua",
	'client/client.lua'
}

server_script {
	'@vrp/lib/utils.lua',
	'server/server.lua'
}

ui_page 'web/index.html'

files {
	'web/*.html',
	'web/*.css',
	'web/*.js',
	"web/assets/**"
}