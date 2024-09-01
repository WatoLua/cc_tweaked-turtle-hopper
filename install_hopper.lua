local githubBaseUrl = "https://raw.githubusercontent.com"
local username = "WatoLua"
local defaultBranch = "main"
local files = {
    ["cc_tweaked-utils"] = {"utils/turtle/environment.lua", "utils/turtle/inventory.lua"},
    ["cc_tweaked-turtle-hopper"] = {"hopper.lua"}
}

local function buildUrl(repositoryName, filePath)
    return githubBaseUrl.."/"..username.."/"..repositoryName.."/"..defaultBranch.."/"..filePath
end

local function split(str, sep)
    local result = {}
    local regex = ("([^%s]+)"):format(sep)
    for each in str:gmatch(regex) do
       table.insert(result, each)
    end
    return result
end

local function moveFileInTree(file)
    path = split(file, "/")
    for i=1, #path-1 do
        if not fs.exists(path[i]) then
            fs.makeDir("/"..shell.dir().."/"..path[i])
        end
        shell.setDir("/"..shell.dir().."/"..path[i])
    end
    shell.setDir("/")
    if #path > 1 then
        fs.move(path[#path], file)
    end
end

local function downloadFiles()
    for repo, file in pairs(files) do
        for i=1, #file do
            shell.run("wget "..buildUrl(repo, file[i]))
            moveFileInTree(file[i])
        end
    end
end

function main()
    shell.setDir("/")
    downloadFiles()
end

main()
