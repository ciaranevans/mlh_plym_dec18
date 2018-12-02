loadStuff = {}

function loadStuff:loadThings()
    ball = {}
    ball.x = GB_WIDTH / 2
    ball.y = GB_HEIGHT / 2
    ball.y_vel = 0
    ball.jump_height = -4.5
    ball.gravity = -30
    ball.ground = ball.y
    background = love.graphics.newImage("background.png")
    ball.texture = love.graphics.newImage("ball.png")
    font = love.graphics.newFont("monogram_extended.ttf", 16)
    love.graphics.setFont(font)
end

return loadStuff