resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

description "LuaLeaks Taco Job"

client_scripts {
  'client/taco_job_client.lua',
  'client/taco_client.lua',
  'Config.lua',
}

server_scripts {
  'server/taco_server.lua',
  'Config.lua',
}