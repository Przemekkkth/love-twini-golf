GameScreen = Object:extend()

function GameScreen:new()
    self.area = Area(self)
    self:loadLevel()
end

function GameScreen:update(dt)
    self.area:update(dt)
    self:checkWin()
    self:syncPointRotation()
end

function GameScreen:draw()
    love.graphics.draw(Bg_IMG, 0, 0)
    self.area:draw()
end

function GameScreen:loadLevel()
    self:loadTiles()
    self:loadHoles()
    self:loadBalls()
end

function GameScreen:loadTiles()
    tiles = {}
    if current_level == 1 then
        table.insert(tiles, self.area:addGameObject('Tile', 64*3, 64*3, {type = TILE_TYPE.DARK_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 64*4, 64*3, {type = TILE_TYPE.DARK_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 64*0, 64*3, {type = TILE_TYPE.DARK_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 64*1, 64*3, {type = TILE_TYPE.DARK_64}) )

        table.insert(tiles, self.area:addGameObject('Tile', 64*3 + 64*5, 64*3, {type = TILE_TYPE.LIGHT_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 64*4 + 64*5, 64*3, {type = TILE_TYPE.LIGHT_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 64*0 + 64*5, 64*3, {type = TILE_TYPE.LIGHT_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 64*0 + 64*5, 64*3, {type = TILE_TYPE.LIGHT_64}) )
    elseif current_level == 2 then
        table.insert(tiles, self.area:addGameObject('Tile', 64*2, 64*3, {type = TILE_TYPE.DARK_64}) )

        table.insert(tiles, self.area:addGameObject('Tile', 64*4 + 64*5, 64*3, {type = TILE_TYPE.DARK_64}) )
    elseif current_level == 3 then
        table.insert(tiles, self.area:addGameObject('Tile', 32*1 + 32*10 + 16, 32*5, {type = TILE_TYPE.LIGHT_32}) )
    elseif current_level == 4 then
        table.insert(tiles, self.area:addGameObject('Tile', 32*4, 32*7, {type = TILE_TYPE.DARK_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*3, 32*5, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*6, 32*3, {type = TILE_TYPE.DARK_32}) )

        table.insert(tiles, self.area:addGameObject('Tile', 32*4 + 64*5, 32*2, {type = TILE_TYPE.LIGHT_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*3 + 32*10, 32*6, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*6 + 32*10, 32*9, {type = TILE_TYPE.LIGHT_32}) )
    elseif current_level == 5 then
        table.insert(tiles, self.area:addGameObject('Tile', 32*3, 32*1, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*1, 32*3, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*5, 32*3, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*3, 32*5, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*7, 32*5, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*7, 32*10, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*3, 32*10, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*5, 32*12, {type = TILE_TYPE.DARK_32}) )
        --table.insert(tiles, self.area:addGameObject('Tile', 32*7, 32*10, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*8, 32*7, {type = TILE_TYPE.DARK_64}) )

        table.insert(tiles, self.area:addGameObject('Tile', 32*2 + 32*10, 32*2, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*5 + 32*10, 32*11, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*3 + 32*10, 32*1, {type = TILE_TYPE.LIGHT_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*8 + 32*10, 32*6, {type = TILE_TYPE.LIGHT_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*3 + 32*10, 32*11, {type = TILE_TYPE.LIGHT_64}) )
    elseif current_level == 6 then
        table.insert(tiles, self.area:addGameObject('Tile', 32*0, 32*3, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*1, 32*3, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*2, 32*3, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*3, 32*3, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*4, 32*3, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*5, 32*3, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*6, 32*3, {type = TILE_TYPE.DARK_32}) )

        table.insert(tiles, self.area:addGameObject('Tile', 32*3, 32*6, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*4, 32*6, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*5, 32*6, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*6, 32*6, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*7, 32*6, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*8, 32*6, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*9, 32*6, {type = TILE_TYPE.DARK_32}) )

        table.insert(tiles, self.area:addGameObject('Tile', 32*0, 32*10, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*1, 32*10, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*2, 32*10, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*6, 32*10, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*7, 32*10, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*8, 32*10, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*9, 32*10, {type = TILE_TYPE.DARK_32}) )


        table.insert(tiles, self.area:addGameObject('Tile', 32*0 + 32*10, 32*3, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*1 + 32*10, 32*3, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*2 + 32*10, 32*3, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*3 + 32*10, 32*3, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*4 + 32*10, 32*3, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*5 + 32*10, 32*3, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*6 + 32*10, 32*3, {type = TILE_TYPE.LIGHT_32}) )

        table.insert(tiles, self.area:addGameObject('Tile', 32*3 + 32*10, 32*6, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*4 + 32*10, 32*6, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*5 + 32*10, 32*6, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*6 + 32*10, 32*6, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*7 + 32*10, 32*6, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*8 + 32*10, 32*6, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*9 + 32*10, 32*6, {type = TILE_TYPE.LIGHT_32}) )

        table.insert(tiles, self.area:addGameObject('Tile', 32*0 + 32*10, 32*10, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*1 + 32*10, 32*10, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*2 + 32*10, 32*10, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*6 + 32*10, 32*10, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*7 + 32*10, 32*10, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*8 + 32*10, 32*10, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*9 + 32*10, 32*10, {type = TILE_TYPE.LIGHT_32}) )
    elseif current_level == 7 then
        table.insert(tiles, self.area:addGameObject('Tile', 32*4, 32*6, {type = TILE_TYPE.DARK_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*2, 32*6, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*7, 32*9, {type = TILE_TYPE.DARK_32}) )

        table.insert(tiles, self.area:addGameObject('Tile', 32*4 + 32*10, 32*6, {type = TILE_TYPE.LIGHT_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*2 + 32*10, 32*4, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*7 + 32*10, 32*9, {type = TILE_TYPE.LIGHT_32}) )
    elseif current_level == 8 then
        table.insert(tiles, self.area:addGameObject('Tile', 32*4, 32*4, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*3, 32*2, {type = TILE_TYPE.DARK_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*2, 32*2, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*5, 32*3, {type = TILE_TYPE.DARK_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*6, 32*2, {type = TILE_TYPE.DARK_32}) )

        table.insert(tiles, self.area:addGameObject('Tile', 32*4 + 32*10, 32*2, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*3 + 32*10, 32*4, {type = TILE_TYPE.LIGHT_64}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*2 + 32*10, 32*4, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*5 + 32*10, 32*3, {type = TILE_TYPE.LIGHT_32}) )
        table.insert(tiles, self.area:addGameObject('Tile', 32*6 + 32*10, 32*4, {type = TILE_TYPE.LIGHT_32}) )
    end
end 

function GameScreen:loadHoles()
    holes = {}
    if current_level == 1 or current_level == 2 or current_level == 3 then 
        table.insert(holes, self.area:addGameObject('Hole', 8 + 32*4, 8 + 32*2, {}) )
        table.insert(holes, self.area:addGameObject('Hole', 8 + 32*4 + 32*10, 8 + 32*2, {}) )
    elseif current_level == 3 then
        table.insert(holes, self.area:addGameObject('Hole', 8 + 32*2, 6 + 32*5, {}) )
        table.insert(holes, self.area:addGameObject('Hole', 8 + 32*4 + 32*10, 6 + 32*3, {}) )
    elseif current_level == 4 then
        table.insert(holes, self.area:addGameObject('Hole', 24 + 32*4, 22 + 32*1, {}) )
        table.insert(holes, self.area:addGameObject('Hole', 24 + 32*4 + 32*10, 22 + 32*11, {}) )
    elseif current_level == 5 then
        table.insert(holes, self.area:addGameObject('Hole', 24 + 32*1, 22 + 32*1, {}) )
        table.insert(holes, self.area:addGameObject('Hole', 24 + 32*10, 22 + 32*7, {}) )
    elseif current_level == 6 then
        table.insert(holes, self.area:addGameObject('Hole', 24 + 32*1, 22 + 32*1, {}) )
        table.insert(holes, self.area:addGameObject('Hole', 24 + 32*8 + 32*10, 24 + 32*12, {}) )
    elseif current_level == 7 then
        table.insert(holes, self.area:addGameObject('Hole', 32*7+8, 32*4+8, {}) )
        table.insert(holes, self.area:addGameObject('Hole', 32*2+8+32*10, 32*9+8, {}) )
    elseif current_level == 8 then
        table.insert(holes, self.area:addGameObject('Hole', 32*5+8, 32*2+8, {}) )
        table.insert(holes, self.area:addGameObject('Hole', 32*4+8+32*10, 32*3+8, {}) )
    end
end

function GameScreen:loadBalls()
    if current_level == 1 or current_level == 2 then
        self.ball = self.area:addGameObject('Ball', 24 + 32*4, 24 + 32 * 11, {index = 0})
        self.ball1 = self.area:addGameObject('Ball', 24 + 32*4 + 32*10, 24 + 32*11, {index = 1})
    elseif current_level == 3 then 
        self.ball = self.area:addGameObject('Ball', 8 + 32*7, 8 + 32*10, {index = 0})
        self.ball1 = self.area:addGameObject('Ball', 8 + 32*7 + 32*10, 8 + 32*10, {index = 1})
    elseif current_level == 4 then
        self.ball = self.area:addGameObject('Ball', 24 + 32*4, 24 + 32*5, {index = 0})
        self.ball1 = self.area:addGameObject('Ball', 24 + 32*4 + 32*10, 24 + 32*4, {index = 1})
    elseif current_level == 5 then
        self.ball = self.area:addGameObject('Ball', 24 + 32*2, 24 + 32*12, {index = 0}) 
        self.ball1 = self.area:addGameObject('Ball', 24 + 32*10, 24 + 32*5, {index = 1})
    elseif current_level == 6 then
        self.ball  = self.area:addGameObject('Ball', 24 + 32*8, 24 + 32*12, {index = 0}) 
        self.ball1 = self.area:addGameObject('Ball', 24 + 32*0 + 32*10, 22 + 32*1, {index = 1})
    elseif current_level == 7 then
        self.ball  = self.area:addGameObject('Ball', 32*2+8, 32*9+8, {index = 0}) 
        self.ball1 = self.area:addGameObject('Ball', 32*7+8 + 32*10, 32*4+8, {index = 1})
    elseif current_level == 8 then
        self.ball  = self.area:addGameObject('Ball', 32*4+8, 32*9+8, {index = 0}) 
        self.ball1 = self.area:addGameObject('Ball', 32*4+8+32*10, 32*9+8, {index = 1})
    end

    self.ball:addPoint(self.area:addGameObject('Point', 50, 50, {active = false}))
    self.ball:addPowerBar( self.area:addGameObject('PowerBar', 50, 50, {}) )
    self.ball1:addPoint(self.area:addGameObject('Point', 50, 50, {active = false}))
    self.ball1:addPowerBar( self.area:addGameObject('PowerBar', 50, 50, {}) )

    self.ball:setVelocity(0, 0)
    self.ball:setScale(1, 1)
    self.ball:setWin(false)

    self.ball1:setVelocity(0, 0)
    self.ball1:setScale(1, 1)
    self.ball1:setWin(false)
end

function GameScreen:checkWin() 
    if self.ball:getScale().x < 0.0 and self.ball1:getScale().x < 0 then
        current_level = current_level + 1
        self.area = nil
        self.area = Area(self)
        self:loadLevel()
    end
end

function GameScreen:syncPointRotation()
    if isLeftHalfClicked == true then
        self.ball1.point:setAngle( self.ball.point:getAngle() )  
    else
        self.ball.point:setAngle( self.ball1.point:getAngle() )
    end
end