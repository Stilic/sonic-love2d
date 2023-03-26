local Object = Class:extend()

function Object:new()
    self.x = 0
    self.y = 0
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

return Object
