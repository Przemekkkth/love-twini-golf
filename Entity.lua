Entity = Object:extend()

function Entity:new(area, x, y, opts)
    local opts = opts or {}
    if opts then for k, v in pairs(opts) do self[k] = v end end

    self.area = area
    self.x = x
    self.y = y
    self.scaleX = 1
    self.scaleY = 1
    self.originX = 0
    self.originY = 0
    self.angle  = 0
    self.texture = Ball_IMG
end

function Entity:update(dt)

end

function Entity:draw()
    local x = self.x + self.originX
    local y = self.y + self.originY
    pushRotateScale(x, y, self.angle, self.scaleX, self.scaleY)
    love.graphics.draw(self.texture, x, y)
    love.graphics.pop()
end

function Entity:getPos()
    return {x = self.x, y = self.y}
end

function Entity:setAngle(angle)
    self.angle = angle
end

function Entity:getAngle()
    return self.angle
end

function Entity:setScale(x, y)
    self.scaleX = x
    self.scaleY = y
end

function Entity:getScale()
    return {x = self.scaleX, y = self.scaleY}
end

function Entity:setPos(x, y)
    
    self.x = x
    self.y = y 
end

function Entity:getOrigin()
    return {x = self.originX, y = self.originY}
end

function Entity:setOrigin(x, y)
    self.originX = x
    self.originY = y
end