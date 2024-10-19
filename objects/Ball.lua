Ball = Entity:extend()

function Ball:new(area, x, y, opts)
    Ball.super.new(self, area, x, y, opts)

    self.velocity = {x = 0, y = 0}
    self.initialMousePos = {x = self.x, y = self.y}
    self.target = {x = -100, y = -100}
    self.launchedVelocity = {x = 5, y = 5}
    self.velocity1D = 0.0
    self.launchedVelocity1D = 0.0
    self.canMove = true
    self.playedSwingFx = true
    self.strokes = 0
    self.dirX = 1
    self.dirY = 1
    self.win = false
    self.friction = 0.33
    self.speed = 5.0
    self.texture = Ball_IMG
end

function Ball:update(dt)    
    if self.win then
        if self:getPos().x < self.target.x then
            self:setPos( self:getPos().x + 0.1*self.speed, self:getPos().y )
        elseif self:getPos().x > self.target.x then
            self:setPos( self:getPos().x - 0.1*self.speed, self:getPos().y )
        elseif self:getPos().y < self.target.y then
            self:setPos( self:getPos().x, self:getPos().y + 0.1*self.speed)
        elseif self:getPos().y > self.target.y then
            self:setPos( self:getPos().x, self:getPos().y - 0.1*self.speed)
        end

        self:setScale( self:getScale().x - 0.001*self.speed, self:getScale().y - 0.001*self.speed)
        if self:getScale().x < 0.001 then
            self:setScale(-0.001, self:getScale().y)
        end
        if self:getScale().y < 0.001 then 
            self:setScale( self:getScale().x, -0.001)
        end

        return
    end

    for index, _hole in ipairs(holes) do --holes is in main.lua
        local marginX = 5 
        local marginY = 5 

        if  self:getPos().x + marginX < _hole:getPos().x + _hole.texture:getWidth() - marginX and 
            self:getPos().x + self.texture:getWidth() - marginX > _hole:getPos().x + marginX and
            self:getPos().y + marginY < _hole:getPos().y + _hole.texture:getHeight() - marginY and 
            self:getPos().y + self.texture:getWidth() - marginY > _hole:getPos().y + marginY then 
                self:setWin(true)
                self:setVelocity(0, 0)
                self:setPos(_hole:getPos().x, _hole:getPos().y)
                self.target.x = _hole:getPos().x
                self.target.y = _hole:getPos().y
        end
    end

    if input:pressed('leftButton') and self.canMove then
        local x, y = love.mouse.getPosition()
        self:setInitialMousePos(x, y)
    end

    if input:down('leftButton') and self.canMove then
        local mouseX, mouseY = love.mouse.getPosition()
        local _velocityX =  (self:getInitialMousePos().x - mouseX) * 2
        local _velocityY =  (self:getInitialMousePos().y - mouseY) * 2
        
        if _velocityX == 0 then
            _velocityX = 0.01
        elseif _velocityY == 0 then
            _velocityY = 0.01
        end

        self:setVelocity(_velocityX, _velocityY)
        self:setLaunchedVelocity(_velocityX, _velocityY)
        self.velocity1D = math.sqrt(math.pow(math.abs(self:getVelocity().x), 2) + math.pow(math.abs(self:getVelocity().y), 2))
        self.launchedVelocity1D = self.velocity1D

        self:showPoint(mouseX, mouseY)
        
        self.dirX = math.floor( self.velocity.x / math.abs(self.velocity.x) )
        self.dirY = math.floor( self.velocity.y / math.abs(self.velocity.y) )
        
        self:showPowerBar()

        if self.velocity1D > 1 then
            self.velocity1D = 1
            self.launchedVelocity1D = 1
        end
        if self.launchedVelocity1D < 0.001 then
            self.launchedVelocity1D = 0.001
        end
    else
        
        --[[
        if (!playedSwingFx)
        {
            mSound.play(SoundEffect::Swing);
            playedSwingFx = true;
            strokes++;
        }

        ]]
        self:hidePowerBar()

        self:hidePoint()
        self.canMove = false

        local new_x = self.x + self.velocity.x * dt
        local new_y = self.y + self.velocity.y * dt
        
        self:setPos(new_x,
                    new_y)

        if self:getVelocity().x > 0.0001 or self:getVelocity().x < -0.0001 or self:getVelocity().y > 0.0001 or self:getVelocity().y < -0.0001 then
            if self.velocity1D > 0 then
                self.velocity1D = self.velocity1D - self.friction*dt
            else
                self.velocity1D = 0
            end

            self.velocity.x = (self.velocity1D / self.launchedVelocity1D) * math.abs(self.launchedVelocity.x) * self.dirX
            self.velocity.y = (self.velocity1D / self.launchedVelocity1D) * math.abs(self.launchedVelocity.y) * self.dirY
        else
            self:setVelocity(0, 0)
            local mouseX, mouseY = love.mouse.getPosition()
            self:setInitialMousePos(mouseX, mouseY)
            self.canMove = true
        end

        if self:getPos().x + self.texture:getWidth() > SCREEN_WIDTH / (2 - self.index) then
            self:setVelocity(-math.abs(self:getVelocity().x), self:getVelocity().y)
            self.dirX = -1
        elseif self:getPos().x < (self.index * SCREEN_WIDTH / 2) then
            self:setVelocity(math.abs(self:getVelocity().x), self:getVelocity().y)
            self.dirX = 1
        elseif self:getPos().y + self.texture:getHeight()> SCREEN_HEIGHT then
            self:setVelocity(self:getVelocity().x, -math.abs(self:getVelocity().y))
            self.dirY = -1
        elseif self:getPos().y < 0 then
            self:setVelocity(self:getVelocity().x, math.abs(self:getVelocity().y))
            self.dirY = 1
        end

        for index, _tile in ipairs(tiles) do
            local newX = self:getPos().x + self:getVelocity().x * dt
            local newY = self:getPos().y
            if newX + 16 > _tile:getPos().x and newX < _tile:getPos().x + _tile.texture:getWidth() and newY + 16 > _tile:getPos().y and newY < _tile:getPos().y + _tile.texture:getHeight() - 3 then
                self:setVelocity(-self:getVelocity().x, self:getVelocity().y)
                self.dirX = -self.dirX
            end

            local newX = self:getPos().x
            local newY = self:getPos().y + self:getVelocity().y * dt

            if newX + 16 > _tile:getPos().x and newX < _tile:getPos().x + _tile.texture:getWidth() and newY + 16 > _tile:getPos().y and newY < _tile:getPos().y + _tile.texture:getHeight() - 3 then
                self:setVelocity(self:getVelocity().x, -self:getVelocity().y)
                self.dirY = -self.dirY
            end
        end
    end
end

function Ball:setVelocity(x, y)
    self.velocity.x = x
    self.velocity.y = y
end

function Ball:setLaunchedVelocity(x, y)
    self.launchedVelocity.x = x
    self.launchedVelocity.y = y
end

function Ball:setInitialMousePos(x, y)
    self.initialMousePos.x = x
    self.initialMousePos.y = y
end

function Ball:setWin(on)
    self.win = on
end

function Ball:getVelocity()
    return self.velocity
end

function Ball:getInitialMousePos()
    return self.initialMousePos
end

function Ball:addPoint(point)
    self.point = point
end

function Ball:addPowerBar(powerBar)
    self.powerBar = powerBar
end

function Ball:showPoint(mouseX, mouseY)
    if self.point then
        self.point:setActive(true)
        self.point:setAngle(math.atan2(self:getPos().y - mouseY, self:getPos().x - mouseX) + math.pi / 2)
        self.point:setPos(self:getPos().x, self:getPos().y)
    end
end

function Ball:hidePoint()
    if self.point then
        self.point:setActive(false)
    end
end

function Ball:showPowerBar()
    if self.powerBar then
        self.powerBar:setActive(true)
        self.powerBar:setPos( self:getPos().x + 32 + 8, self:getPos().y - 32 )
        self.powerBar:setFillValue(self.velocity1D / math.sqrt(math.pow(SCREEN_WIDTH / 2, 2) + math.pow(SCREEN_HEIGHT / 2, 2) ))
    end
end

function Ball:hidePowerBar()
    if self.powerBar then
        self.powerBar:setActive(false)
    end
end