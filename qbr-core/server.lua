RPX = exports['rpx-core']:GetObject()

local function ErrNotImpl()
    print("Not Implemented")
end

local function CheckPlayerData(source, RPXPlayer)
    PlayerData = {}
    PlayerData.source = source
    PlayerData.citizenid = RPXPlayer.citizenid
    PlayerData.license = RPXPlayer.license
    PlayerData.name = GetPlayerName(source)
    PlayerData.cid = RPXPlayer.slot
    PlayerData.money = RPXPlayer.money
    -- Charinfo
    PlayerData.charinfo = {}
    PlayerData.charinfo.firstname = RPXPlayer.charinfo.firstname 
    PlayerData.charinfo.lastname = RPXPlayer.charinfo.lastname
    PlayerData.charinfo.birthdate = RPXPlayer.charinfo.age
    PlayerData.charinfo.gender = RPXPlayer.charinfo.gender
    PlayerData.charinfo.nationality = 'USA'
    PlayerData.charinfo.account = '0'

    -- Metadata
    PlayerData.metadata = RPXPlayer.metadata or {}
    PlayerData.metadata['hunger'] = RPXPlayer.metadata['hunger'] or 100
    PlayerData.metadata['thirst'] = RPXPlayer.metadata['thirst'] or 100
    PlayerData.metadata['stress'] = RPXPlayer.metadata['stress'] or 0
    PlayerData.metadata['isdead'] = RPXPlayer.metadata['isdead'] or false
    PlayerData.metadata['inlaststand'] = RPXPlayer.metadata['inlaststand'] or false
    PlayerData.metadata['armor'] = RPXPlayer.metadata['armor'] or 0
    PlayerData.metadata['ishandcuffed'] = RPXPlayer.metadata['ishandcuffed'] or false
    PlayerData.metadata['injail'] = RPXPlayer.metadata['injail'] or 0
    PlayerData.metadata['jailitems'] = RPXPlayer.metadata['jailitems'] or {}
    PlayerData.metadata['status'] = RPXPlayer.metadata['status'] or {}
    PlayerData.metadata['commandbinds'] = RPXPlayer.metadata['commandbinds'] or {}
    PlayerData.metadata['bloodtype'] = RPXPlayer.metadata['bloodtype'] or 'A+'
    PlayerData.metadata['dealerrep'] = RPXPlayer.metadata['dealerrep'] or 0
    PlayerData.metadata['craftingrep'] = RPXPlayer.metadata['craftingrep'] or 0
    PlayerData.metadata['callsign'] = RPXPlayer.metadata['callsign'] or 'NO CALLSIGN'

    PlayerData.metadata['inside'] = RPXPlayer.metadata['inside'] or {
        house = nil,
        apartment = {
            apartmentType = nil,
            apartmentId = nil,
        }
    }

    PlayerData.metadata['xp'] = RPXPlayer.metadata['xp'] or {
        ['main'] = 0,
        ['herbalism'] = 0,
        ['mining'] = 0
    }

    PlayerData.metadata['licences'] = RPXPlayer.metadata['licences'] or {
        ['weapon'] = false
    }

    PlayerData.metadata['levels'] = RPXPlayer.metadata['levels'] or {
        ['main'] = 0,
        ['herbalism'] = 0,
        ['mining'] = 0
    }

    PlayerData.metadata['optin'] = RPXPlayer.metadata['optin'] or true

    -- Job
    PlayerData.job = {}
    PlayerData.job.name = RPXPlayer.job.name
    PlayerData.job.label = 'Unknown'
    PlayerData.job.payment = 0

    PlayerData.job.onduty = false
    PlayerData.job.isboss = false
    PlayerData.job.grade = {}
    PlayerData.job.grade.name = 'UNK'
    PlayerData.job.grade.level = RPXPlayer.job.rank
    -- Gang
    PlayerData.gang = {}
    PlayerData.gang.name = RPXPlayer.gang.name
    PlayerData.gang.label = 'Unknown'
    PlayerData.gang.isboss = false
    PlayerData.gang.grade = {}
    PlayerData.gang.grade.name = 'UNK'
    PlayerData.gang.grade.level = RPXPlayer.gang.rank
    -- Other
    PlayerData.position = vector3(0.0, 0.0, 0.0)
    PlayerData.LoggedIn = true

    return PlayerData
end

GetPlayer = function(source)
    local player = RPX.GetPlayer(source)
    if player then
        local QBRPlayerData = CheckPlayerData(source, player)
        local self = {}
        self.Functions = {}
        self.PlayerData = QBRPlayerData
    
        self.Functions.UpdatePlayerData = function()
            RPX.UpdateStateBags(player.source)
        end
    
        self.Functions.SetJob = function(job, grade)
            TriggerClientEvent("QBCore:Client:OnJobUpdate", source, {name = job, grade = grade, label = 'Unknown', isboss = false})
            player.SetJob(job, grade)
        end
    
        self.Functions.SetGang = function(gang, grade)
            TriggerClientEvent("QBCore:Client:OnGangUpdate", source, {name = gang, grade = grade, label = 'Unknown', isboss = false})
            player.SetGang(gang, grade)
        end
    
        self.Functions.SetJobDuty = function(onDuty)
            return ErrNotImpl()
        end
    
        self.Functions.SetMetaData = function(meta, val)
            player.SetMetaData(meta, val)
        end
    
        self.Functions.AddJobReputation = function(amount)
            local keyname = 'jobrep:'..player.job.name
            if not player.metadata[keyname] then
                player.SetMetaData(keyname, 0)
            end
            player.SetMetaData(keyname, player.metadata[keyname] + amount)
        end
    
        self.Functions.AddMoney = function(moneytype, amount, reason)
            player.AddMoney(moneytype, amount)
        end
    
        self.Functions.RemoveMoney = function(moneytype, amount, reason)
            if player.money[moneytype] >= amount then
                player.RemoveMoney(moneytype, amount)
            else
                return false
            end
        end
    
        self.Functions.SetMoney = function(moneytype, amount, reason)
            player.SetMoney(moneytype, amount)
        end
    
        self.Functions.GetMoney = function(moneytype)
            return player.money[moneytype]
        end
    
        self.Functions.AddXp = function(skill, amount)
            player.SetMetaData('xp:'..skill, player.metadata['xp:'..skill] + amount)
        end
    
        self.Functions.RemoveXp = function(skill, amount)
            player.SetMetaData('xp:'..skill, player.metadata['xp:'..skill] - amount)
        end
    
        self.Functions.Save = function()
            player.Save()
        end
    
        return self
    end
    return nil
end
exports('GetPlayer', GetPlayer)

exports('GetPlayerByCitizenId', function(citizenid)
    return RPX.GetPlayerByCitizenId(citizenid)
end)

RegisterNetEvent("QBCore:Notify", function(...)
    TriggerEvent("RPX:Notify", ...)
end)

exports('CreateCallback', function(name, cb, ...)
    exports['rpx-core']:CreateCallback(name, cb, ...)
end)

exports('GetPlayers', function()
    local sources = {}
    for k, v in pairs(RPX.Players) do
        sources[#sources+1] = k
    end
    return sources
end)

exports('GetQBPlayers', function()
    local QBPlayers = {}
    for k, v in pairs(RPX.Players) do
        QBPlayers[k] = GetPlayer(k)
    end
    return QBPlayers
end)

RegisterNetEvent("SERVER:RPX:PlayerLoaded", function(source)
    local player = GetPlayer(source)
    if player then
        TriggerEvent("QBCore:Server:OnPlayerLoaded", source, player)
    end
end)

-- © 2023 Sinatra#0101 & RPX Framework RedM