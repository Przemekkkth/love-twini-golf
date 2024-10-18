PowerBar = Entity:extend()

function PowerBar:new(area, x, y, opts)
    PowerBar.super.new(self, area, x, y, opts)
    self.texture = PowermeterOverlay_IMG
    self.textureBG = PowermeterBG_IMG
    self.scaleX = 0.75
    self.scaleY = 0.75

    self.fillValue = 0.10
    self.active = false
end

function PowerBar:draw()
    if self.active == false then
        return
    end
    pushRotateScale(self.x, self.y, self.angle, self.scaleX, self.scaleY)
    love.graphics.draw(self.textureBG, self.x, self.y)
    local fillRect = {x = self.x + 4, y = self.y + 4, w = self.texture:getWidth() - 8, h = self.texture:getHeight() - 8}
    
    if self.fillValue < 0.33 then 
        love.graphics.setColor(0, 1, 0)
    elseif self.fillValue >= 0.33 and self.fillValue < 0.66 then
        love.graphics.setColor(1, 1, 0)
    else
        love.graphics.setColor(1, 0, 0)
    end
    love.graphics.rectangle('fill', fillRect.x,
                                    fillRect.y + ((1 - self.fillValue) * fillRect.h), 
                                    fillRect.w, 
                                    fillRect.h - ((1 - self.fillValue) * fillRect.h))
    

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.texture, self.x, self.y)
    love.graphics.pop()
end

function PowerBar:setFillValue(value)
    if value > 1 then
        self.fillValue = 1
    else 
        self.fillValue = value
    end
end

function PowerBar:setActive(on)
    self.active = on
end