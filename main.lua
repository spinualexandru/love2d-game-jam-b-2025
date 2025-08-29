local Settings = require("engine.settings")
local Map = require("engine.map")

function love.load()
    Settings:load()
    Map:load()
end

function love.update(dt)
    Map:update(dt)
end

function love.draw()
    love.graphics.clear(Settings.ui.default.background_color)
    love.graphics.setColor(Settings.ui.default.text_color)
    love.graphics.print("Hello", 25, 25)

    Map:draw()
end
