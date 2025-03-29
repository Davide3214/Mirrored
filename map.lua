map = {}
function map.load()
    map.window = love.graphics.newImage("Sprites/Window.png")
    map.white_layer = love.graphics.newImage("Sprites/White_layer.png")
end

function map.update(dt)
    
end

function map.draw()
    love.graphics.draw(map.window, 400, 400)
    love.graphics.draw(map.white_layer, 400, 400)
end

return map