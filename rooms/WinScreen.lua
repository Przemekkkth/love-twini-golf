WinScreen = Object:extend()

function WinScreen:new()
    self.showHint = true
    timer:every(0.33, function() self.showHint = not self.showHint end)
end

function WinScreen:update(dt)
    if input:pressed('n') then
        gotoRoom('MenuScreen')
    end
end

function WinScreen:draw()
    love.graphics.setFont(big_font)
    local _font = love.graphics.getFont()
    local textWidth = _font:getWidth('Twini Golf')
    love.graphics.print('Twini Golf', SCREEN_WIDTH / 2, 100, 0, 1, 1, textWidth / 2)
    love.graphics.setFont(font)
    local resultText = '           Congratulation!\n You are master of TwiniGolf.\n           Your result: '..strokes
    love.graphics.print(resultText, SCREEN_WIDTH / 2, 200, 0, 1, 1, love.graphics.getFont():getWidth(resultText) / 2)
    if self.showHint then 
        love.graphics.print('Press n key to start', SCREEN_WIDTH / 2, 400, 0, 1, 1, font:getWidth('Press n key to start') / 2)
    end
end