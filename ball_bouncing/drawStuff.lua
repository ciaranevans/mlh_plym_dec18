drawStuff = {}

SPRITE_CENTER = 8

function drawStuff:draw(image, x, y)
    love.graphics.draw(image, x - SPRITE_CENTER, y - SPRITE_CENTER)
end

return drawStuff