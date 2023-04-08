fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

-- Written by Sinatra#0101 for RPX Framework
-- This wrapper attempts to achieve the same compatibility as the RedEM-RP wrapper.
-- However, there will be some incompatibilities still.
-- This wrapper is intended as a LAST RESORT for scripts that cannot be manually converted, such as QBR-Core locked/escrowed scripts.
-- Use of this wrapper is currently not recommended. Proceed at your own risk.

description 'RPX QBR-Core Wrapper'
author 'Sinatra#0101'
version '0.0.1'

server_script 'server.lua'
client_script 'client.lua'

lua54 'yes'