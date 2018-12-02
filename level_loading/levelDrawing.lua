levelDrawing = {}

tiles = {}

origin_x = 0
origin_y = 0
tile_dim = 16

function levelDrawing:loadTextures()
    blank_tex = love.graphics.newImage("blank.png")
    grass_tex = love.graphics.newImage("grass.png")
    tiles = {["blank"]=blank_tex,["grass"]=grass_tex}
end

function levelDrawing:drawLevel(levelToDraw)
    for k, v in pairs(levelToDraw) do
        origin_x = 0
        for k1, v1 in pairs(v) do
            love.graphics.draw(tiles[v1], origin_x, origin_y)
            origin_x = origin_x + tile_dim
        end
        origin_y = origin_y + tile_dim
    end
    origin_y = 0
end

return levelDrawing