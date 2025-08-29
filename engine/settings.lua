local Settings = {
    window = {
        width = 800,
        height = 600,
        title = "Cartographer's Curse"
    }
}

function Settings:apply()
    love.window.setMode(Settings.window.width, Settings.window.height)
    love.window.setTitle(Settings.window.title)
end

return Settings
