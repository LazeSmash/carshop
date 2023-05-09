RegisterServerEvent("sellcar")
AddEventHandler("sellcar", function(plate, model, price)
    MySQL.Sync.insert("INSERT INTO carshop (plate, model, price) VALUES (?, ?, ?)", { plate, string.lower(model), price })
end)

RegisterServerEvent("carlist")
AddEventHandler("carlist", function(plate, model, price)
    local source = source 
    local cars = MySQL.Sync.fetchAll("SELECT * FROM carshop", {})

    print(json.encode(cars, { pretty = true }))

    for k,v in pairs(cars)do 
        local car = v.plate .. " (" .. v.model .. ") : $" .. v.price
        TriggerClientEvent("chatMessage", source, "carshop", {255,255,255}, car)
    end
end)

RegisterServerEvent("buycar")
AddEventHandler("buycar", function(plate)
    local car = MySQL.Sync.fetchAll("SELECT * FROM carshop WHERE plate = ?", { plate })
    if car[1] == nil then return end 

    MySQL.Sync.execute("DELETE FROM carshop WHERE plate = ?", { plate })
end)
