local rs = require "lib.resolution_solution"
Class = require "lib.classic"

Util = require "game.Util"
Object = require "game.Object"
Player = require "game.Player"

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
end

function love.draw()
  rs.start()
  love.graphics.print(player.heightRadius, 100, 100)
  rs.stop()
end
