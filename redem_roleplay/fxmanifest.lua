fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

-- Written by Sinatra#0101 for RPX Framework
-- This wrapper enables you to run RedEM-RP scripts on RPX Framework with (almost) no changes. Most should work out of the box.
-- This wrapper also enables you to run locked RedEM-RP scripts on the RPX Framework.
-- This wrapper is compatible with RedEM-RP 2023 "reboot" by yours truly, as well as the original / "old" redemrp by amakuu, kane, ktos, and others.

-- RedEM-RP 2023 scripts would access the player using RedEM.GetPlayer(source) and import the RedEM object. This is implemented here.
-- RedEM-RP original / "old" scripts would access the player using "redemrp:getPlayerFromId" event. This is also implemented here.

-- Using this wrapper should be fine, but I am not responsible for any broken scripts that occur as a result of using this wrapper with unedited RedEM-RP scripts.
-- Support will not be provided for those that use any of these wrappers for unedited RedEM-RP scripts.
-- If problems or incompatibilities still occur, try to fix them yourself, or ask for help in the RPX Framework Discord server. (https://discord.gg/mMNJsDEFp5)
-- Remember, RPX Framework is documented well and has a lot of examples. You should be able to figure out how to fix most problems yourself.
-- You can find the RPX Framework documentation at https://rpx.red/

description 'RPX RedEM:RP Wrapper'
author 'Sinatra#0101'
version '0.0.1'

server_script 'server.lua'
client_script 'client.lua'

lua54 'yes'