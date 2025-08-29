local Colors = {}
Colors.__index = Colors

function Colors.fromHex(hexColor)
    -- Remove the '#' prefix if it exists
    if string.sub(hexColor, 1, 1) == "#" then
        hexColor = string.sub(hexColor, 2)
    end

    -- If the hex color starts with 'rgba', extract the values
    if string.len(hexColor) == 8 then
        hexColor = string.sub(hexColor, 3)
    end

    local r, g, b, a

    -- Check for valid hex string length (6 for RGB, 8 for RGBA)
    if #hexColor == 6 then
        -- Extract R, G, B components
        r = tonumber(string.sub(hexColor, 1, 2), 16)
        g = tonumber(string.sub(hexColor, 3, 4), 16)
        b = tonumber(string.sub(hexColor, 5, 6), 16)
        a = 255 -- Default alpha to full opacity
    elseif #hexColor == 8 then
        -- Extract R, G, B, A components
        r = tonumber(string.sub(hexColor, 1, 2), 16)
        g = tonumber(string.sub(hexColor, 3, 4), 16)
        b = tonumber(string.sub(hexColor, 5, 6), 16)
        a = tonumber(string.sub(hexColor, 7, 8), 16)
    else
        -- Handle invalid hex string length
        -- You might want to return an error or default values here
        -- For this example, we'll return black with full alpha
        print(
            "Warning: Invalid hex color string length. Expected 6 or 8 characters (excluding '#'). Got: " .. #hexColor
        )
        return { 0, 0, 0, 1 }
    end

    -- Normalize values to 0-1 range and limit to 3 decimals
    r = tonumber(string.format("%.3f", r / 255))
    g = tonumber(string.format("%.3f", g / 255))
    b = tonumber(string.format("%.3f", b / 255))
    a = tonumber(string.format("%.3f", a / 255))

    return { r, g, b, a }
end

return Colors
