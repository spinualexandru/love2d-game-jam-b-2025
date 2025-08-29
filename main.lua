local Settings = require("engine.settings")

function love.load()
    Settings:apply()
end

function love.update() end

function love.draw()
    love.graphics.print("Hello", 25, 25)
end
