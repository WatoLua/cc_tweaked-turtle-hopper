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
        found = environmentUtils.suckAt(args[1])
        if not found then
            goto continue
        end
        ::drop::
        ok = environmentUtils.dropAt(args[2])
        if not ok then
            goto drop
        end
        if maxLoop > 0 then
            i = i + 1
        end
    end
end
main()
