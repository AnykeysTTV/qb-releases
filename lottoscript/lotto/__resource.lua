resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "nui/index.html"

files {
	"nui/index.html",
	"nui/js/index.js",
	"nui/ui.js",
	"nui/css/style.css",
	"nui/pop.mp3",
	"nui/win.mp3",
	"nui/lose.mp3"
}

client_script {
	'config.lua',
	'click.lua',
	'client.lua',
}

server_script {
  'config.lua',
  'server.lua'
  
}
