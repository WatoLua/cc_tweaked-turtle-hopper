local githubBaseUrl = "https://raw.githubusercontent.com"
local username = "WatoLua"
local defaultBranch = "main"
local files = {}
files["cc_tweaked-turtle-utils"] = ["environment.lua", "inventory.lua"],
files["cc_tweaked-turtle-hopper"] = ["hopper.lua"]

local function buildUrl(repositoryName, filePath)
    return githubBaseUrl.."/"..username.."/"..repositoryName.."/"..defaultBranch.."/"..filePath
end

function main()
    for repo, file in pairs(files) do
        for i=1, #file do
            shell.run("wget "..buildUrl(repo, file))
        end
    end
end

main()
