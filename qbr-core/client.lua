RPX = exports['rpx-core']:GetObject()

local function ErrNotImpl()
    print("Not Implemented")
end

GetPlayerData = function()
    local PlayerData = {}
    PlayerData.source = source
    PlayerData.citizenid = LocalPlayer.state.citizenid
    PlayerData.license = LocalPlayer.state.license
    PlayerData.name = GetPlayerName(source)
    PlayerData.cid = LocalPlayer.state.slot
    PlayerData.money = {
        cash = LocalPlayer.state.cash,
        bank = LocalPlayer.state.bank
    }
    -- Charinfo
    PlayerData.charinfo = {}
    PlayerData.charinfo.firstname = LocalPlayer.state.firstname 
    PlayerData.charinfo.lastname = LocalPlayer.state.lastname
    PlayerData.charinfo.birthdate = LocalPlayer.state.age
    PlayerData.charinfo.gender = LocalPlayer.state.gender
    PlayerData.charinfo.nationality = 'Unknown'
    PlayerData.charinfo.account = '0'

    -- Metadata
    PlayerData.metadata = LocalPlayer.state.metadata

    -- Job
    PlayerData.job = {}
    PlayerData.job.name = LocalPlayer.state.job
    PlayerData.job.label = 'Unknown'
    PlayerData.job.payment = 0

    PlayerData.job.onduty = false
    PlayerData.job.isboss = false
    PlayerData.job.grade = {}
    PlayerData.job.grade.name = 'UNK'
    PlayerData.job.grade.level = tonumber(LocalPlayer.state.jobrank)
    -- Gang
    PlayerData.gang = {}
    PlayerData.gang.name = LocalPlayer.state.gang
    PlayerData.gang.label = 'Unknown'
    PlayerData.gang.isboss = false
    PlayerData.gang.grade = {}
    PlayerData.gang.grade.name = 'UNK'
    PlayerData.gang.grade.level = tonumber(LocalPlayer.state.gangrank)
    -- Other
    PlayerData.position = vector3(0.0, 0.0, 0.0)
    PlayerData.LoggedIn = true
    return PlayerData
end
exports("GetPlayerData", GetPlayerData)

exports('TriggerCallback', function(name, cb)
    exports['rpx-core']:TriggerCallback(name, cb)
end)

RegisterNetEvent("CLIENT:RPX:PlayerLoaded", function()
    TriggerEvent("QBCore:Client:OnPlayerLoaded", source, player)
end)

-- © 2023 Sinatra#0101 & RPX Framework RedM