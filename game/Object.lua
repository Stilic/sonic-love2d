local Sensor = Class:extend()

function Sensor:new(parent, type, right)
    self.parent = parent
    self.type = type
    self.right = right
end

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

function Object:getSizeBase()
    return self.x + math.floor(self.widthRadius / 1.5) + 1
end

function Object:getHitboxWidth()
    return math.floor(self.hitboxWidthRadius * 2) + 1
end

function Object:getHitboxHeight()
    return math.floor(self.hitboxHeightRadius * 2) + 1
end

function Object:getHitboxBase()
    return self.x + math.floor(self.hitboxWidthRadius / 1.5) + 1
end

function Object:draw()
    if self.sprite then
        local x, y, sx, sy, ox, oy = self.x, self.y, 1, 1, self.sprite:getWidth() / 2 + 1,
            self.sprite:getHeight() / 2 + 1
        if self.flipX then
            sx = -sx
        end
        if self.flipY then
            sy = -sy
        end
        love.graphics.draw(self.sprite, x + ox, y + oy, self.angle, sx, sy, ox, oy)
    end
    -- local r, g, b, a = love.graphics.getColor()
    -- love.graphics.setColor(0.3, 0.8, 0.3, 0.5)
    -- love.graphics.rectangle("fill", self:getSizeBase(),
    --     self.y, self:getWidth(), self:getHeight())
    -- love.graphics.setColor(r, g, b, a)
end

return Object
