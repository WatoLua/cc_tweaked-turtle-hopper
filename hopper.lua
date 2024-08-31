local args = {...}
local inventoryUtils = require("/utils/inventory")

function checkArgs()
    if #args ~= 3 then
        print("Error : Missing args on execution.")
        print("You need to run this program as follows :")
        print(shell.getRunningProgram().." <side to suck> <side to drop> [repeat]")
        print("repeat parameter can be negative for infinite execution")
        return false
    end
    return true
end

function main()
    if not checkArgs() then
        return
    end
    i = 0
    while i < args[3] or args[3] < 0 do
        err = inventoryUtils.suckAt(args[1])
        inventoryUtils.dropAt(args[2])
    end
end

main()
