Tile = Entity:extend()

function Tile:new(area, x, y, opts)
    Tile.super.new(self, area, x, y, opts)

    if self.type == TILE_TYPE.DARK_32 then
        self.texture = TileDark32_IMG
    elseif self.type == TILE_TYPE.LIGHT_32 then
        self.texture = TileLight32_IMG
    elseif self.type == TILE_TYPE.DARK_64 then
        self.texture = TileDark64_IMG
    elseif self.type == TILE_TYPE.LIGHT_64 then
        self.texture = TileLight64_IMG
    end
end