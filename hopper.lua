local args = {...}
local environmentUtils = require("/utils/turtle/environment")

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
    maxLoop = tonumber(args[3])

    ::continue::
    while i < maxLoop or maxLoop < 0 do
        for slot = 1, 16 do
            turtle.select(slot)
            found = environmentUtils.suckAt(args[1])
            if not found and slot == 1 then
                goto continue
            end
            environmentUtils.dropAt(args[2])
            if maxLoop > 0 then
                i = i + 1
            end
        end
    end
end
main()
