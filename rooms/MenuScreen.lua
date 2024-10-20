MenuScreen = Object:extend()

function MenuScreen:new()
    self.currentIndex = 0
end

function MenuScreen:update(dt)
    if input:released('down_arrow') then
        self.currentIndex = self.currentIndex + 1
        if self.currentIndex >= 3 then
            self.currentIndex = 0
        end
    end
    if input:released('up_arrow') then
        self.currentIndex = self.currentIndex - 1
        if self.currentIndex <= -1 then
            self.currentIndex = 2
        end
    end

    if input:released('enter') then
        if self.currentIndex == 0 then
            strokes = 0
            current_level = 0
            gotoRoom('GameScreen')
        elseif self.currentIndex == 1 then 
            gotoRoom('LevelScreen')
        elseif self.currentIndex == 2 then
            love.event.quit()
        end
    end
end

function MenuScreen:draw()
    love.graphics.setFont(big_font)
    local _font = love.graphics.getFont()
    local textWidth = _font:getWidth('Twini Golf')
    love.graphics.print('Twini Golf', SCREEN_WIDTH / 2, 100, 0, 1, 1, textWidth / 2)

    love.graphics.setFont(font)

    self:drawButton(SCREEN_WIDTH / 2, 175, 'Start', 0)
    self:drawButton(SCREEN_WIDTH / 2, 250, 'Levels', 1)
    self:drawButton(SCREEN_WIDTH / 2, 325, 'Quit', 2)
end

function MenuScreen:drawButton(x, y, text, value)
    if self.currentIndex == value then
        love.graphics.draw(Buttons_IMG, ActiveButton_IMG, x, y, 0, 1, 1, 100)
    else
        love.graphics.draw(Buttons_IMG, InactiveButton_IMG, x, y, 0, 1, 1, 100)
    end
    love.graphics.print(text, x, y+10, 0, 1, 1, love.graphics.getFont():getWidth(text) / 2 )
end