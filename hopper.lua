local args = {...}
local inventoryUtils = require("/utils/inventory")

function checkArgs()
    if #args ~= 4 then
        print("Error : Missing args on execution.")
        print("You need to run this program as follows :")
        print(args[1].." <side to suck> <side to drop> [repeat]")
        print("repeat parameter can be negative for infinite execution")
        shell.exit()
    end
end

function main()
    checkArgs()

    while i < args[4] or args[4] < 0 do
        err = inventoryUtils.suckAt(args[2])
        inventoryUtils.dropAt(args[3])
    end
end