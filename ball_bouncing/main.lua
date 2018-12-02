GB_WIDTH = 160
GB_HEIGHT = 144

push = require 'push'
loadStuff = require 'loadStuff'
drawStuff = require 'drawStuff'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    loadStuff:loadThings()
    
    push:setupScreen(GB_WIDTH,
     GB_HEIGHT,
     GB_WIDTH * 4,
     GB_HEIGHT * 4,
     {fullscreen=false, resizable=false, vsync=true, pixelperfect=true, highdpi=true, stretched=false})
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)
    if love.keyboard.isDown('left') then
        ball.x = ball.x - dt * 120
    end
    if love.keyboard.isDown('right') then
        ball.x = ball.x + dt * 120
    end
    if love.keyboard.isDown('space') then
        if ball.y_vel == 0 then
            ball.y_vel = ball.jump_height
        end
    end

    if ball.y_vel ~= 0 then
        ball.y = ball.y + ball.y_vel * dt * 60
        ball.y_vel = ball.y_vel - ball.gravity * dt
    end

    if ball.y > ball.ground then
        ball.y_vel = 0
        ball.y = ball.ground
    end
end

function love.draw()
    push:apply('start')
    love.graphics.draw(background, 0, 0)
    drawStuff:draw(ball.texture, ball.x, ball.y)
    love.graphics.printf('#LocalHackDay @ Plym!',
        0,
        GB_HEIGHT/2 + 55,
        GB_WIDTH,
        'center')
    push:apply('end')
end