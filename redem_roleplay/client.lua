local RPX = exports['rpx-core']:GetObject()

local function ErrNotImpl()
    print("Not Implemented")
end

RedEM = {

}

-- We don't really need to have anything here to satisfy most RedEM:RP scripts.
-- A lot of them just ask for the shared object on the client anyway.

exports("RedEM", function() 
    return RedEM 
end)

-- © 2023 Sinatra#0101 & RPX Framework RedM