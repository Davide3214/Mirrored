map = {}
sti = require 'Libraries/sti'
Map1 = sti('Maps/map_1.lua')
function map.load()
    Font = love.graphics.newFont("mirrored.ttf", 110)
    love.window.setTitle("Mirrored")
    Interphone_sound = love.audio.newSource("Sounds/Interphone.wav", "static")
    Base = love.graphics.newImage("Sprites/Base.png")
    Text_frame = love.graphics.newImage("Sprites/Text_frame.png")
    Map = 0
    Dialogue = 1
    time = 0
    isdialogue = true
    Font = love.graphics.newFont("mirrored.ttf", 11)
    love.graphics.setFont(Font)
    Interphone_sound:play()
end

function map.update(dt)

    if time < 10 then
        time = time + dt
    else
        isdialogue = false
    end

    if player.x > 800 then
        Map = Map+1
        player.x = 28
    end

    if player.x < 28 then
        player.x = 28
        
    end

    
end

function map.draw()
    if Map == 0 then
        Map1:draw()
    end
    love.graphics.draw(Base, 0, 500)
    if isdialogue == true then
        if Dialogue == 1 then
            if time < 6 then
                love.graphics.draw(Text_frame, 300, 50)
                love.graphics.print("Hello, and welcome to", 305, 50)
                love.graphics.print("MRS", 330, 71, 0, 4, 4)
            else
                love.graphics.draw(Text_frame, 300, 50)
                love.graphics.print("Please, go to", 305, 50, 0, 1.5, 1.5)
                love.graphics.print("the right", 305, 80, 0, 1.5, 1.5)
            end
        end
        
        
    end
    
end

return map