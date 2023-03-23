local BaseObject = Object:extend()

function BaseObject:new()
    self.x = 0
    self.y = 0
    self.xSpeed = 0
    self.ySpeed = 0
    self.groundSpeed = 0
    self.groundAngle = 0
    self.widthRadius = 0
    self.heightRadius = 0
end

function BaseObject:getWidth()
    return math.floor(self.widthRadius * 2) + 1
end

function BaseObject:getHeight()
    return math.floor(self.heightRadius * 2) + 1
end

return BaseObject
