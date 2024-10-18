Hole = Entity:extend()

function Hole:new(area, x, y, opts)
    Hole.super.new(self, area, x, y, opts)

    self.texture = Hole_IMG
end

