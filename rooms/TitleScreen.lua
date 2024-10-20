TitleScreen = Object:extend()

function TitleScreen:new()
    self.showHint = true
    timer:every(0.33, function() self.showHint = not self.showHint end)
end

function TitleScreen:update(dt)
    if input:pressed('n') then
        gotoRoom('MenuScreen')
    end
end

function TitleScreen:draw()
    love.graphics.setFont(big_font)
    local _font = love.graphics.getFont()
    local textWidth = _font:getWidth('Twini Golf')
    love.graphics.print('Twini Golf', SCREEN_WIDTH / 2, 100, 0, 1, 1, textWidth / 2)
    love.graphics.draw(LoveApp_IMG, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, 0, 1, 1, LoveApp_IMG:getWidth() / 2, LoveApp_IMG:getHeight() / 2)
    love.graphics.setFont(font)
    if self.showHint then 
        love.graphics.print('Press n key to start', SCREEN_WIDTH / 2, 400, 0, 1, 1, font:getWidth('Press any key to start') / 2)
    end
end