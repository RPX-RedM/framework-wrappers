RPX = exports['rpx-core']:GetObject()

local function ErrNotImpl()
    print("Not Implemented")
end

RedEM = {
    GetPlayer = function(source)
        local player = RPX.GetPlayer(source)
        if player then
            local RedEMPlayer = function()
                local self = {}
                self.source = source
                self.identifier = player.license
                self.charid = player.slot
                self.name = player.name
                self.group = player.permissiongroup
                self.job = player.job.name
                self.jobgrade = player.job.rank
                self.gang = player.gang.name
                self.ganggrade = player.gang.rank
                self.money = player.money.cash
                self.bankmoney = player.money.bank
                self.firstname = player.charinfo.firstname
                self.lastname = player.charinfo.lastname
                self.fullname = player.charinfo.fullname
                self.pobox = player.metadata.pobox or 0
                self.jailed = player.metadata.jailed or 0

                self.metadata = {}
                self.metadata = player.metadata

                self.citizenid = player.citizenid

                self.SetFirstName = ErrNotImpl -- Not implemented in RPX (yet)
                self.SetLastName = ErrNotImpl -- Not implemented in RPX (yet)

                self.SetJob = function(job)
                    player.SetJob(job, player.job.rank)
                end
                self.SetJobGrade = function(jobgrade)
                    player.SetJob(player.job.name, jobgrade)
                end
                
                self.SetGang = function(gang)
                    player.SetGang(gang, player.gang.rank)
                end

                self.SetGangGrade = function(ganggrade)
                    player.SetGang(player.gang.name, ganggrade)
                end

                self.SetMoney = function(money)
                    player.SetMoney('cash', money)
                end

                self.SetBankMoney = function(bank)
                    player.SetMoney('bank', bank)
                end

                self.RemoveMoney = function(amount)
                    player.RemoveMoney('cash', amount)
                end

                self.RemoveBankMoney = function(amount)
                    player.RemoveMoney('bank', amount)
                end

                self.AddMoney = function(amount)
                    player.AddMoney('cash', amount)
                end

                self.AddBankMoney = function(amount)
                    player.AddMoney('bank', amount)
                end

                self.SetJailTime = function(jailtime)
                    player.SetMetaData('jailed', jailtime)
                end

                -- This function has the same arguments.
                self.SetMetaData = player.SetMetaData

                self.CitizenId = function() return self.citizenid end
                self.GetMetaData = function() return self.metadata end
                self.GetMoney = function() return self.money end
                self.GetBankMoney = function() return self.bankmoney end
                self.GetName = function() return self.firstname .. " " .. self.lastname end
                self.GetFirstName = function() return self.firstname end
                self.GetLastName = function() return self.lastname end
                self.GetJob = function() return self.job end
                self.GetJobGrade = function() return self.jobgrade end
                self.GetGang = function() return self.gang end
                self.GetGangGrade = function() return self.ganggrade end
                self.GetPOBox = function() return self.pobox end
                self.GetJailTime = function() return self.jailed end
                self.SetSessionVar = function(key, value) self[key] = value end
                self.GetSessionVar = function(k) return self[k] end
                self.GetActiveCharacter = function() return self.charid end
                self.SetActiveCharacter = function(charid) self.charid = charid end
                self.GetPermissions = function() return 0 end -- Deprecated function
                self.GetIdentifier = function(i) return self.identifier end
                self.GetGroup = function() return self.group end

                self.set = function(k, v)
                    self[k] = v
                    self.SendPlayerDataToClient()
                end
            
                self.get = function(k)
                    return self[k]
                end
            
                self.setJob = self.SetJob -- RedEM-RP deprecated function name
                self.setFirstname = self.SetFirstName -- RedEM-RP deprecated function name
                self.setLastname = self.SetLastName -- RedEM-RP deprecated function name
                self.setJobgrade = self.SetJobGrade -- RedEM-RP deprecated function name
                self.setGang = self.SetGang -- RedEM-RP deprecated function name
                self.setGanggrade = self.SetGangGrade -- RedEM-RP deprecated function name
                self.setJailTime = self.SetJailTime -- RedEM-RP deprecated function name
                self.setMoney = self.SetMoney -- RedEM-RP deprecated function name
                self.getMoney = self.GetMoney -- RedEM-RP deprecated function name
                self.addMoney = self.AddMoney -- RedEM-RP deprecated function name
                self.removeMoney = self.RemoveMoney -- RedEM-RP deprecated function name
                self.getBankMoney = self.GetBankMoney -- RedEM-RP deprecated function name
                self.setBankMoney = self.SetBankMoney -- RedEM-RP deprecated function name
                self.addBankMoney = self.AddBankMoney -- RedEM-RP deprecated function name
                self.removeBankMoney = self.RemoveBankMoney -- RedEM-RP deprecated function name
                self.setJobXP = self.SetJobXP -- RedEM-RP deprecated function name
                self.addJobXP = self.AddJobXP -- RedEM-RP deprecated function name
                self.removeJobXP = self.RemoveJobXP -- RedEM-RP deprecated function name
                self.getAllJobXP = self.GetAllJobXP -- RedEM-RP deprecated function name
                self.getName = self.GetName -- RedEM-RP deprecated function name
                self.getFirstname = self.GetFirstName -- RedEM-RP deprecated function name
                self.getLastname = self.GetLastName -- RedEM-RP deprecated function name
                self.getJob = self.GetJob -- RedEM-RP deprecated function name
                self.getJobgrade = self.GetJobGrade -- RedEM-RP deprecated function name
                self.getGang = self.GetGang -- RedEM-RP deprecated function name
                self.getGanggrade = self.GetGangGrade -- RedEM-RP deprecated function name
                self.getPOBox = self.GetPOBox -- RedEM-RP deprecated function name
                self.getJailTime = self.GetJailTime -- RedEM-RP deprecated function name
                self.setSessionVar = self.SetSessionVar -- RedEM-RP deprecated function name
                self.getSessionVar = self.GetSessionVar -- RedEM-RP deprecated function name
                self.getPermissions = self.GetPermissions -- RedEM-RP deprecated function name
                self.getIdentifier = self.GetIdentifier -- RedEM-RP deprecated function name
                self.getGroup = self.GetGroup -- RedEM-RP deprecated function name
                self.setGlobal = self.SetGlobal -- RedEM-RP deprecated function name
            
                self.getGold = function() return 0 end -- RedEM-RP deprecated function
                self.getXp = function() return 0 end -- RedEM-RP deprecated function
                self.getLevel = function() return 0 end -- RedEM-RP deprecated function
            
                return self
            end
            return RedEMPlayer()
        end
        return nil
    end,
    RegisterCallback = function(...) exports['rpx-core']:CreateCallback(...) end,
    CreateCallback = function(...) exports['rpx-core']:CreateCallback(...) end,
    Functions = {
        NotifyRight = function(...)
            return
        end,
        NotifyLeft = function(...)
            return
        end,
    },
}

RedEM.GetPlayerCB = function(source, cb)
    local player = RedEM.GetPlayer(source)
    if player then
        cb(player)
    else
        cb(nil)
    end
end
AddEventHandler("redemrp:getPlayerFromId", RedEM.GetPlayerCB)

exports("RedEM", function()
    return RedEM
end)

-- © 2023 Sinatra#0101 & RPX Framework RedM