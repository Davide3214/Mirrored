map = {}
sti = require 'Libraries/sti'
Map1 = sti('Maps/map_1.lua')
function map.load()
    love.window.setTitle("Mirrored")
    Base = love.graphics.newImage("Sprites/Base.png")
    Map = 1
end

function map.update(dt)
    if player.x > 800 then
        Map = Map+1
    end
end

function map.draw()
    if Map == 1 then
        Map1:draw()
    end
    love.graphics.draw(Base, 0, 500)
end

return map