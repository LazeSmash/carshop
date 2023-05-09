function SellCar(source, args) 
    if args[1] == nil then return end 
    if tonumber(args[1]) == nil then return end 

    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped) then return end

    local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(ped, false))
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(ped, false)))
    local price = tonumber(args[1])

    TriggerServerEvent("sellcar", plate, model, price)
end

function CarList()
    TriggerServerEvent("carlist")
end

function BuyCar(source, args)
    if args[1] == nil then return end 

    local plate = args[1]
    TriggerServerEvent("buycar", plate)
end

RegisterCommand("sellcar", SellCar)
RegisterCommand("carlist", CarList)
RegisterCommand("buycar", BuyCar)
