local rs = require "lib.resolution_solution"
Class = require "lib.classic"

Util = require "game.Util"
Object = require "game.Object"
Player = require "game.Player"

-- TODO: move this in a better place
love.graphics.setDefaultFilter("nearest", "nearest")

function math.sign(x)
  return x > 0 and 1 or x < 0 and -1 or 0
end

local player = Player("sonic")

function love.load()
  love.mouse.setVisible(false)
  local os = love.system.getOS()
  if os == "Android" or os == "iOS" then love.window.setFullscreen(true) end
  rs.init({ width = 320, height = 224, mode = 1 })
end

function love.resize(w, h)
  rs.resize(w, h)
end

function love.update(dt)
  dt = math.min(dt, 1 / 30)
  player:update(dt)
end

function love.keypressed(k)
  if k == "f" then
    player.flipX = not player.flipX
  end
end

function love.draw()
  rs.start()
  love.graphics.clear(0.4, 0.4, 0.2)
  player:draw()
  rs.stop()
end
