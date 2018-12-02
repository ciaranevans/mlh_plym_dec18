GB_WIDTH = 160
GB_HEIGHT = 144
push = require 'push'
levelLoading = require 'levelLoading'
levelDrawing = require 'levelDrawing'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    loadedLevel = levelLoading:loadLevel('level1.csv')
    levelDrawing:loadTextures()
    push:setupScreen(GB_WIDTH,
     GB_HEIGHT,
     GB_WIDTH * 4,
     GB_HEIGHT * 4,
     {fullscreen=false, resizable=false, vsync=true, pixelperfect=true, highdpi=true, stretched=false})
     font = love.graphics.newFont("monogram_extended.ttf", 16)
     love.graphics.setFont(font)
end

function love.draw()
    push:apply('start')
    levelDrawing:drawLevel(loadedLevel)
    love.graphics.printf('#LocalHackDay @ Plym!',
        0,
        GB_HEIGHT/2 + 55,
        GB_WIDTH,
        'center')
    displayFPS()
    push:apply('end')
end

function displayFPS()
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 16, 10)
end