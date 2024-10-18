Point = Entity:extend()

function Point:new(area, x, y, opts)
    Point.super.new(self, area, x, y, opts)
    self.originX = 8
    self.originY = 2
    self.texture = Point_IMG
    self.active = true
end

function Point:draw()
    if self.active == true then
        local x = self.x + 8
        local y = self.y + 8
        love.graphics.draw(self.texture, x, y, self.angle, 1, 1, self.originX, self.originY)
    end
end

function Point:setActive(on)
    self.active = on
end