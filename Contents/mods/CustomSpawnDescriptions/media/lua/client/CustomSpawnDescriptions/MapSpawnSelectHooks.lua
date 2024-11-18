local super_fillList = MapSpawnSelect.fillList

function MapSpawnSelect:fillList()
    super_fillList(self)

    for _, listboxItem in ipairs(self.listbox.items) do
        local item = listboxItem.item
        local region = item.region
        if not item.description and region.description then
            item.description = region.description
        end
        if not item.worldimage and region.thumb then
            if region.thumb:match("^https?://") then
                item.worldimage = CustomSpawnDescriptions.DownloadTexture(region.thumb)
            else
                item.worldimage = getTexture(region.thumb)
            end
        end
    end
end
