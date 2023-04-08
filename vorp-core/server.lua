RPX = exports['rpx-core']:GetObject()

local function ErrNotImpl()
    print("Not Implemented")
end

AddEventHandler('getCore', function(cb)
    local coreData = {}

    coreData.getUser = function(source)
        if source == nil then return nil end
        local RPXPlayer = RPX.GetPlayer(source)
        local vorpUser = function()
            local self = {}

            self._identifier = RPXPlayer.identifier
            self._license = RPXPlayer.license
            self._group = RPXPlayer.permissiongroup
            self._playerwarnings = {}
            self._charperm = false
            self._usercharacters = {}
            self._numofcharacters = 0
            self.usedCharacterId = -1
            self.source = source
        
            self.UsedCharacterId = function(value)            
                return RPXPlayer.slot
            end
        
            self.Source = function(value)
                return RPXPlayer.source
            end

            self.Numofcharacters = function(value)
                -- TODO: impl in RPX
                return 1
            end
            self.Identifier = function(value)
                if value ~= nil then
                    self._identifier = value
                end
                return self._identifier
            end
            self.License = function(value)
                if value ~= nil then
                    self._license = value
                end
                return self._license
            end
        
            self.Group = function(value)
                if value ~= nil then
                    self._group = value
                end
                return self._group
            end
        
            self.Playerwarnings = function()
                return self._playerwarnings
            end
        
            self.Charperm = function(value)
                return self._charperm
            end
    
            self.___UsedCharacterF = function()
                local self = {}

                self.identifier = RPXPlayer.identifier
                self.charIdentifier = RPXPlayer.citizenid
                self.group = RPXPlayer.permissiongroup
                self.job = RPXPlayer.job.name
                self.jobgrade = RPXPlayer.job.rank
                self.firstname = RPXPlayer.firstname
                self.lastname = RPXPlayer.lastname
                self.inventory = {}
                self.status = {}
                self.coords = {}
                self.skin = RPXPlayer.skin
                self.comps = {}
                self.money = RPXPlayer.money.cash
                self.gold = 0
                self.rol = 0
                self.healthOuter = 0
                self.healthInner = 0
                self.staminaOuter = 0
                self.staminaInner = 0
                self.xp = 0
                self.hours = 0
                self.isdead = RPXPlayer.metadata.isDead
                self.source = source

                self.Identifier = function()
                    return self.identifier
                end

                self.CharIdentifier = function(value)
                    if value ~= nil then
                        self.charIdentifier = value
                    end
                    return self.charIdentifier
                end
                self.Group = function(value)
                    if value ~= nil then
                        --
                    end
                    return self.group
                end
                self.Job = function(value)
                    if value ~= nil then RPXPlayer.SetJob(value, RPXPlayer.job.rank) end
                    return self.job
                end
                self.Jobgrade = function(value)
                    if value ~= nil then RPXPlayer.SetJob(RPXPlayer.job.name, value) end
                    return self.jobgrade
                end
                self.Firstname = function(value)
                    if value ~= nil then 
                        print("Not impl")
                    end
                    return self.firstname
                end
                self.Lastname = function(value)
                    if value ~= nil then print("Not impl") end
                    return self.lastname
                end
                self.Inventory = function(value)
                    if value ~= nil then print("Not impl") end
                    return self.inventory
                end
                self.Status = function(value)
                    if value ~= nil then print("Not impl") end
                    return self.status
                end
                self.Coords = function(value)
                    if value ~= nil then print("Not impl") end
                    return self.coords
                end
                self.Money = function(value)
                    if value ~= nil then RPXPlayer.SetMoney('cash', value) end
                    return self.money
                end
                self.Gold = function(value)
                    if value ~= nil then print("Not impl") end
                    return self.gold
                end
                self.Rol = function(value)
                    if value ~= nil then print("Not impl") end
                    return self.rol
                end
                self.HealthOuter = function(value)
                    if value ~= nil then print("Not impl") end
                    return self.healthOuter
                end
                self.HealthInner = function(value)
                    if value ~= nil then print("Not impl") end
                    return self.healthInner
                end
                self.StaminaOuter = function(value)
                    if value ~= nil then print("Not impl") end
                    return self.staminaOuter
                end
                self.StaminaInner = function(value)
                    if value ~= nil then print("Not impl") end
                    return self.staminaInner
                end
                self.Xp = function(value)
                    if value ~= nil then print("Not impl") end
                    return self.xp
                end
                self.Hours = function(value)
                    if value ~= nil then print("Not impl") end
                    return self.hours
                end
                self.IsDead = function(value)
                    if value ~= nil then RPXPlayer.SetMetaData('isDead', value) end
                    return self.isdead
                end

                self.Skin = function(value)
                    if value ~= nil then
                        RPXPlayer.SetSkinData(value)
                    end

                    return RPX.GetPlayer(source).skin
                end

                self.Comps = function(value)
                    if value ~= nil then
                        RPXPlayer.SetClothesData(value)
                    end

                    return RPX.GetPlayer(source).clothes
                end

                self.getCharacter = function()
                    local userData = {}

                    userData.identifier = self.identifier
                    userData.charIdentifier = self.charIdentifier
                    userData.group = self.group
                    userData.job = self.job
                    userData.jobGrade = self.jobgrade
                    userData.money = self.money
                    userData.gold = self.gold
                    userData.rol = self.rol
                    userData.xp = self.xp
                    userData.healthOuter = self.healthOuter
                    userData.healthInner = self.healthInner
                    userData.staminaOuter = self.staminaOuter
                    userData.staminaInner = self.staminaInner
                    userData.hours = self.hours
                    userData.firstname = self.firstname
                    userData.lastname = self.lastname
                    userData.inventory = self.inventory
                    userData.status = self.status
                    userData.coords = self.coords
                    userData.isdead = self.isdead
                    userData.skin = self.skin
                    userData.comps = self.comps

                    userData.setStatus = function(status) --Prevent bugs here
                        self.Status(status)
                    end

                    userData.setJobGrade = function(jobgrade)
                        self.Jobgrade(jobgrade)
                    end

                    userData.setGroup = function(group)
                        self.Group(group)
                    end

                    userData.setJob = function(job)
                        self.Job(job)
                    end

                    self.setJobGrade = function(jobgrade)
                        self.Jobgrade(jobgrade)
                    end

                    userData.setMoney = function(money)
                        self.Money(money)
                        self.updateCharUi()
                    end

                    userData.setGold = function(gold)
                        self.Gold(gold)
                        self.updateCharUi()
                    end

                    userData.setRol = function(rol)
                        self.Rol(rol)
                        self.updateCharUi()
                    end

                    userData.setXp = function(xp)
                        self.Xp(xp)
                        self.updateCharUi()
                    end

                    userData.setFirstname = function(firstname)
                        self.Firstname(firstname)
                    end

                    userData.setLastname = function(lastname)
                        self.Lastname(lastname)
                    end

                    userData.updateSkin = function(skin)
                        self.Skin(skin)
                    end

                    userData.updateComps = function(comps)
                        self.Comps(comps)
                    end

                    userData.addCurrency = function(currency, quantity)
                        self.addCurrency(currency, quantity)
                    end

                    userData.removeCurrency = function(currency, quantity)
                        self.removeCurrency(currency, quantity)
                    end

                    userData.addXp = function(xp)
                        self.addXp(xp)
                    end

                    userData.removeXp = function(xp)
                        self.removeXp(xp)
                    end

                    userData.updateCharUi = function()
                        local nuipost = {}

                        nuipost["type"] = "ui"
                        nuipost["action"] = "update"
                        nuipost["moneyquanty"] = self.Money()
                        nuipost["goldquanty"] = self.Gold()
                        nuipost["rolquanty"] = self.Rol()
                        nuipost["serverId"] = self.source
                        nuipost["xp"] = self.Xp()

                        TriggerClientEvent("vorp:updateUi", self.source, json.encode(nuipost))
                    end

                    return userData
                end

                self.GetUser = function()
                    local userData = {}
            
                    userData.getIdentifier = function()
                        return RPXPlayer.identifier
                    end
            
                    userData.getGroup = self.Group()
            
                    userData.getPlayerwarnings = function()
                        return self.Playerwarnings()
                    end
            
                    userData.setPlayerWarnings = function(warnings)
                        self.Playerwarnings(warnings)
                    end
            
                    userData.getCharperm = self.Charperm()
            
                    userData.source = self.source
            
                    userData.setGroup = function(group)
                        self.Group(group)
                    end
            
                    userData.setCharperm = function(char)
                        self.Charperm(char)
                    end
            
                    userData.getUsedCharacter = self.___UsedCharacterF
                    userData.getUserCharacters = self.UserCharacters()
            
                    userData.getNumOfCharacters = function()
                        return self._numofcharacters
                    end
            
                    userData.addCharacter = function(firstname, lastname, skin, comps)
                        self._numofcharacters = self._numofcharacters + 1 --Should not be done like this
                        self.addCharacter(firstname, lastname, skin, comps)
                    end
            
                    userData.removeCharacter = function(charid)
                        if self._usercharacters[charid] then
                            self._numofcharacters = self._numofcharacters - 1 --Should not be done like this
                            self.delCharacter(charid)
                        end
                    end
            
                    userData.setUsedCharacter = function(charid)
                        self.SetUsedCharacter(charid)
                    end
            
                    return userData
                end
    

                self.updateCharUi = function()
    
                end

                self.addCurrency = function(currency, quantity) --add check for security
                    if currency == 0 then
                        RPXPlayer.AddMoney('cash', quantity)
                    elseif currency == 1 then
                        print("Not impl")
                    elseif currency == 2 then
                        print("Not impl")
                    end
                    self.updateCharUi()
                end

                self.removeCurrency = function(currency, quantity) --add check for security
                    if currency == 0 then
                        RPXPlayer.RemoveMoney('cash', quantity)
                    elseif currency == 1 then
                        self.gold = self.gold - quantity
                    elseif currency == 2 then
                        self.rol = self.rol - quantity
                    end
                    self.updateCharUi()
                end

                self.addXp = function(quantity) --add check for security
                    
                    self.updateCharUi()
                end

                self.removeXp = function(quantity) --add check for security
                    
                    self.updateCharUi()
                end

                self.saveHealthAndStamina = function(healthOuter, healthInner, staminaOuter, staminaInner)
  
                end

                self.setJob = function(newjob)
                    self.Job(newjob)
                end

                self.setGroup = function(newgroup)
                    self.Group(newgroup)
                end

                self.setDead = function(dead)
                    self.IsDead(dead)
                end

                self.UpdateHours = function(hours)
                    print("Not impl")
                end

                self.SaveNewCharacterInDb = function(cb)
                    print("Not impl")
                end

                self.DeleteCharacter = function()
                    print("Not impl")
                end

                self.SaveCharacterCoords = function(coords)
                    print("Not impl")
                end

                self.SaveCharacterInDb = function()
                    print("Not impl")
                end

                print("Character init")
                return self
            end
            self.___UsedCharacter = self.___UsedCharacterF()

            self.getUsedCharacter = self.___UsedCharacter
            
        
            self.UsedCharacter = function()
                return self.___UsedCharacter
            end
        
            self.UserCharacters = function()
                local userCharacters = {}
                return userCharacters
            end
        
            self.GetUsedCharacter = function()
                if self.___UsedCharacter then
                    return self.___UsedCharacter
                else
                    return nil
                end
            end
        
            self.SetUsedCharacter = function(charid)
                
            end

            self.getIdentifier = function()
                return RPXPlayer.license
            end
        
            return self
        end
        return vorpUser()
    end

    coreData.maxCharacters = 4

    coreData.addRpcCallback = function(name, callback)
        TriggerEvent("vorp:addNewCallBack", name, callback)
    end

    coreData.getUsers = function()
        -- TODO: impl in rpx
        return {}
    end

    coreData.Warning = function(text)
        print("^3WARNING: ^7" .. tostring(text) .. "^7")
    end

    coreData.Error = function(text)
        print("^1ERROR: ^7" .. tostring(text) .. "^7")
    end

    coreData.Success = function(text)
        print("^2SUCCESS: ^7" .. tostring(text) .. "^7")
    end

    coreData.NotifyTip = function(source, text, duration)
        local _source = source

    end

    coreData.NotifyLeft = function(source, title, subtitle, dict, icon, duration, colors)
        local _source = source

    end

    coreData.NotifyRightTip = function(source, text, duration)
        local _source = source

    end

    coreData.NotifyObjective = function(source, text, duration)
        local _source = source

    end

    coreData.NotifyTop = function(source, text, location, duration)
        local _source = source

    end

    coreData.NotifySimpleTop = function(source, text, subtitle, duration)
        local _source = source

    end

    coreData.NotifyAvanced = function(source, text, dict, icon, text_color, duration, quality, showquality)
        local _source = source

    end

    coreData.NotifyCenter = function(source, text, duration, color)
        local _source = source

    end

    coreData.NotifyBottomRight = function(source, text, duration)
        local _source = source

    end

    coreData.NotifyFail = function(source, text, subtitle, duration)
        local _source = source

    end

    coreData.NotifyDead = function(source, title, audioRef, audioName, duration)
        local _source = source

    end

    coreData.NotifyUpdate = function(source, title, subtitle, duration)
        local _source = source

    end

    coreData.NotifyWarning = function(source, title, msg, audioRef, audioName, duration)
        local _source = source

    end

    coreData.dbUpdateAddTables = function(tbl)

    end

    coreData.dbUpdateAddUpdates = function(updt)

    end

    coreData.AddWebhook = function(title, webhook, description, color, name, logo, footerlogo, avatar)

    end

    cb(coreData)
end)
