player={}
anim8 = require 'Libraries/anim8'
love.graphics.setDefaultFilter("nearest", "nearest")
function player.load()
    player.x = 400
    player.y = 450
    player.Legs_spritesheet = love.graphics.newImage("Sprites/Legs_spritesheet.png")
    player.Torso = love.graphics.newImage("Sprites/Torso.png")
    player.Head_spritesheet = love.graphics.newImage("Sprites/Head_spritesheet.png")
    player.Leg_grid = anim8.newGrid(16, 32, player.Legs_spritesheet:getWidth(), player.Legs_spritesheet:getHeight())
    player.Head_grid = anim8.newGrid(16, 32, player.Head_spritesheet:getWidth(), player.Head_spritesheet:getHeight())
    
    player.animation = {
        left = anim8.newAnimation(player.Leg_grid('1-8', 1), 0.15),
        right = anim8.newAnimation(player.Leg_grid('1-8', 1), 0.15),
        Head = anim8.newAnimation(player.Head_grid('1-8', 1), 0.2),
    }
    player.anim = player.animation.left
    
end

function player.update(dt)
    ismoving = false
    
    if love.keyboard.isDown("a") then
        player.x = player.x - 2.5 
        player.anim = player.animation.right
        ismoving = true
    end
    if love.keyboard.isDown("d") then
        player.x = player.x + 2.5 
        player.anim = player.animation.left
        ismoving = true
    end
    if ismoving == true then
        player.anim:update(dt)
    else
        player.anim:gotoFrame(4)
    end    
    player.animation.Head:update(dt)
end

function player.draw()
    love.graphics.setBackgroundColor(255, 255, 255)
    if player.anim == player.animation.left then
        player.anim:draw(player.Legs_spritesheet, player.x, player.y, 0, 3, 3)
        love.graphics.draw(player.Torso, player.x, player.y, 0, 3, 3)
        player.animation.Head:draw(player.Head_spritesheet, player.x, player.y, 0, 3, 3)
    else
        player.anim:draw(player.Legs_spritesheet, player.x+16, player.y, 0, -3, 3)
        love.graphics.draw(player.Torso, player.x+16, player.y, 0, -3, 3)
        player.animation.Head:draw(player.Head_spritesheet, player.x+16, player.y, 0, -3, 3)

    end 
end

return player