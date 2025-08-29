local Colors = require("engine.colors")

local Settings = {
    window = {
        width = 800,
        height = 600,
        title = "Cartographer's Curse"
    },
    ui = {
        default = {
            font_path = "assets/fonts/PixelCode.ttf",
            size = 18,
            font = nil,
            background_color = Colors.fromHex("#7CAED9"),
            text_color = Colors.fromHex("#DCF3F4"),
        },
        colors = {
            primary = Colors.fromHex("#0952A8"),
            secondary = Colors.fromHex("#DCF3F4"),
            background_color = Colors.fromHex("#7CAED9")
        }
    }
}

function Settings:apply()
    love.window.setMode(Settings.window.width, Settings.window.height)
    love.window.setTitle(Settings.window.title)
    love.graphics.setFont(self.ui.default.font)
end

function Settings:load()
    self.ui.default.font = love.graphics.newFont(self.ui.default.font_path, self.ui.default.size)

    self:apply()
end

return Settings
