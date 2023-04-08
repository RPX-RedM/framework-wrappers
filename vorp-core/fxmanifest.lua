fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

-- Written by Sinatra#0101 for RPX Framework
-- This wrapper attempts to achieve the same compatibility as the RedEM-RP wrapper.
-- However, there will be a lot of incompatibilities still.
-- This wrapper is intended as a LAST RESORT for scripts that cannot be manually converted.
-- Use of this wrapper is currently not recommended. Proceed at your own risk.

-- As a sidenote for this wrapper, I have no idea how to make this work properly with RPX.
-- The VorpCore lua framework is a convoluted mess of spaghetti code. (No offense)

description 'RPX VorpCore Wrapper'
author 'Sinatra#0101'
version '0.0.1'

server_script 'server.lua'
client_script 'client.lua'

lua54 'yes'