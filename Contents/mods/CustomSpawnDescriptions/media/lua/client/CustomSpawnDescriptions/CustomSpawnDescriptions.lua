CustomSpawnDescriptions = CustomSpawnDescriptions or {}

function CustomSpawnDescriptions.DownloadTexture(url)
    local file = string.gsub(url, "[^%w]", "") .. ".png"
    local path = Core.getMyDocumentFolder() .. "\\Lua\\" .. file
    local inputStream = getUrlInputStream(url)
    local writer = getFileOutput(file)
    writer:write(inputStream:readAllBytes())
    writer:close()
    inputStream:close()
    return getTexture(path)
end