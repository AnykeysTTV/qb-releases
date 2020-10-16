
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page('html/index.html') 

files({
  'html/index.html',
  'html/style.css',
})

client_scripts {
  'config.lua',
  'client/main.lua',
}

server_scripts {
  'config.lua',
  'server/main.lua'
}
