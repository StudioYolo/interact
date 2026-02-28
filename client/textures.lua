local settings = require 'shared.settings'
local textures = settings.Textures
local txd = CreateRuntimeTxd('interactions_txd')

local function loadTextures(style)
    for _, v in pairs(textures) do
        CreateRuntimeTextureFromImage(txd, tostring(v), 'assets/'..style..'/'..v..'.png')
    end
end

loadTextures(settings.Style)

RegisterNetEvent('interact:setStyle', function(style)
    if type(style) == 'string' then
        txd = CreateRuntimeTxd('interactions_txd')
        loadTextures(style)
        print('Style set to '..style)
    end
end)