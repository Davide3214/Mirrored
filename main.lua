player = require('player')
reflection = require('reflection')
map = require('map')
function love.load()
    
    map.load()
    reflection.load()
    player.load()
end

function love.update(dt)
    map.update()
    reflection.update(dt)
    player.update(dt)
end

function love.draw()
    map.draw()
    reflection.draw()
    player.draw()
end