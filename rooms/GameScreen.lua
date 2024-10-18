GameScreen = Object:extend()

function GameScreen:new()
    self.area = Area(self)


    self:loadLevel()
end

function GameScreen:update(dt)
    self.area:update(dt)
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
    end
end 

function GameScreen:loadHoles()
    holes = {}
    if current_level == 1 then 
        table.insert(holes, self.area:addGameObject('Hole', 8 + 32*4, 8 + 32*2, {}) )
        table.insert(holes, self.area:addGameObject('Hole', 8 + 32*4 + 32*10, 8 + 32*2, {}) )
    end
end

function GameScreen:loadBalls()
    if current_level == 1 then
        self.ball = self.area:addGameObject('Ball', 24 + 32*4, 24 + 32 * 11, {index = 0})
        self.ball:addPoint(self.area:addGameObject('Point', 50, 50, {active = false}))
        self.ball:addPowerBar( self.area:addGameObject('PowerBar', 50, 50, {}) )

        self.ball1 = self.area:addGameObject('Ball', 24 + 32*4 + 32*10, 24 + 32*11, {index = 1})
        self.ball1:addPoint(self.area:addGameObject('Point', 50, 50, {active = false}))
        self.ball1:addPowerBar( self.area:addGameObject('PowerBar', 50, 50, {}) )
    end

    self.ball:setVelocity(0, 0)
    self.ball:setScale(1, 1)
    self.ball:setWin(false)

    self.ball1:setVelocity(0, 0)
    self.ball1:setScale(1, 1)
    self.ball1:setWin(false)
end
