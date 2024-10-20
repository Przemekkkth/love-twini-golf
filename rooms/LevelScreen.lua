LevelScreen = Object:extend()

function LevelScreen:new()
    self.currentIndex = 0
end

function LevelScreen:update(dt)
    if input:released('down_arrow') then
        self.currentIndex = self.currentIndex + 1
        if self.currentIndex >= 10 then
            self.currentIndex = 0
        end
    end
    if input:released('up_arrow') then
        self.currentIndex = self.currentIndex - 1
        if self.currentIndex <= -1 then
            self.currentIndex = 9
        end
    end

    if input:released('enter') then
        strokes = 0
        if self.currentIndex ~= 9 then
            self:openLevel()
        else
            gotoRoom('MenuScreen')
        end
        
    end
end

function LevelScreen:draw()
    love.graphics.setFont(big_font)
    local _font = love.graphics.getFont()
    local textWidth = _font:getWidth('Twini Golf')
    love.graphics.print('Twini Golf', SCREEN_WIDTH / 2, 100, 0, 1, 1, textWidth / 2)

    love.graphics.setFont(font)
    self:drawButton(115, 200, "0", 0)
    self:drawButton(SCREEN_WIDTH / 2, 200, "1", 1)
    self:drawButton(525, 200, "2", 2)

    self:drawButton(115, 275, "3", 3)
    self:drawButton(SCREEN_WIDTH / 2, 275, "4", 4)
    self:drawButton(525, 275, "5", 5)

    self:drawButton(115, 350, "6", 6)
    self:drawButton(SCREEN_WIDTH / 2, 350, "7", 7)
    self:drawButton(525, 350, "8", 8)

    self:drawButton(525, 425, "Menu", 9)
end

function LevelScreen:drawButton(x, y, text, value)
    if self.currentIndex == value then
        love.graphics.draw(Buttons_IMG, ActiveButton_IMG, x, y, 0, 1, 1, 100)
    else
        love.graphics.draw(Buttons_IMG, InactiveButton_IMG, x, y, 0, 1, 1, 100)
    end
    love.graphics.print(text, x, y+10, 0, 1, 1, love.graphics.getFont():getWidth(text) / 2 )
end

function LevelScreen:openLevel()
    current_level = self.currentIndex
    gotoRoom('GameScreen')
end 