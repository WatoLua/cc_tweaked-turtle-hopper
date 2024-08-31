local args = {...}
local inventoryUtils = require("/utils/environment")

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

    while i < args[3] or args[3] < 0 do
        err = environmentUtils.suckAt(args[1])
        environmentUtils.dropAt(args[2])
    end
end
