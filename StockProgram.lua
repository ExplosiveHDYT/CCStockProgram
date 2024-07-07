while true do 
local periList = peripheral.getNames()
local TotalChestItems = 0
local Homogenous = true
local commonItemType = nil

-- Iterate through each peripheral in periList
for _, periName in ipairs(periList) do
    if peripheral.getType(periName) == "minecraft:chest" then
        local chest = peripheral.wrap(periName)

        -- Find the common item type in the chest
        for slot, item in pairs(chest.list()) do
            if item.name then
                commonItemType = item.name
                break
            end
        end

        -- Check if all items in the chest are of the same type
        for slot, item in pairs(chest.list()) do
            print(item.count, item.name, slot)
            TotalChestItems = TotalChestItems + tonumber(item.count)

            if commonItemType ~= item.name then
                Homogenous = false
            end
        end
    end
end

print("Common Item Type:", commonItemType)
print("Total Chest Items:", TotalChestItems)
print("Are all Chests Homogeneous:", Homogenous)
print("Enter the amount of items demanded in stacks")

Demand = io.read()*64

Supply = TotalChestItems
print("For", commonItemType)
print("Supply Is", Supply)
print("Demand Is", Demand)
print("Surplus/Deficit is", Supply-Demand)
monitor = peripheral.wrap("right")
monitor.clear()
monitor.setTextScale(1)
monitor.setCursorPos(1,1)
monitor.write("For "..commonItemType)
monitor.setCursorPos(1,2)
monitor.write("Supply Is "..Supply)
monitor.setCursorPos(1,3)
monitor.write("Demand Is "..Demand)
monitor.setCursorPos(1,4)
monitor.write("Surplus/Deficit is "..Supply-Demand)
monitor.setCursorPos(1,1)
end
