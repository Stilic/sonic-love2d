local Object = Class:extend()

function Object:new(x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    self.x = x
    self.y = y
    self.flipX = false
    self.flipY = false
    self.angle = 0
    self.xSpeed = 0
    self.ySpeed = 0
    self.groundSpeed = 0
    self.groundAngle = 0
    self.widthRadius = 0
    self.heightRadius = 0
    self.hitboxWidthRadius = 0
    self.hitboxHeightRadius = 0
end

function Object:getWidth()
    return math.floor(self.widthRadius * 2) + 1
end

function Object:getHeight()
    return math.floor(self.heightRadius * 2) + 1
end

function Object:getHitboxWidth()
    return math.floor(self.hitboxWidthRadius * 2) + 1
end

function Object:getHitboxHeight()
    return math.floor(self.hitboxHeightRadius * 2) + 1
end

function Object:draw(debug)
    if self.sprite then
        local x, y, sx, sy, ox, oy = self.x, self.y, 1, 1, self.sprite:getWidth() / 2 + 1,
            self.sprite:getHeight() / 2 + 1
        if self.flipX then
            x = x + 1
            sx = -sx
        end
        if self.flipY then
            y = y + 1
            sy = -sy
        end
        love.graphics.draw(self.sprite, x + ox, y + oy, self.angle, sx, sy, ox, oy)
    end
    if debug then
        local r, g, b, a = love.graphics.getColor()
        love.graphics.setColor(0.3, 0.8, 0.3, 0.5)
        love.graphics.rectangle("fill", self.x + math.floor(self.widthRadius / 1.5) + 1,
            self.y, self:getWidth(), self:getHeight())
        love.graphics.setColor(r, g, b, a)
    end
end

return Object
