Object = require "lib.classic"
BaseObject = require "game.BaseObject"

function convertGenesisPosition(pixel, subPixel)
    return pixel + math.abs(subPixel / 256)
end

function love.draw()
    love.graphics.print("Among-USB", 100, 100)
end
