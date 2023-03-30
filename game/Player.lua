local Player = Object:extend()

local left, right = "a", "d"

function Player:new(name, x, y)
    Player.super.new(self, x, y)

    self.name = name
    self.widthRadius = 9
    self.heightRadius = 19
    self.hitboxWidthRadius = 8
    self.hitboxHeightRadius = self.heightRadius - 3
    self.sprite = love.graphics.newImage("assets/images/sonic.png")

    self.xSpeed = 0
    self.ySpeed = 0
    self.groundSpeed = 0
    self.groundAngle = 0
    self.onGround = false
    self.jumpForce = 6.5

    if name == "sonic" then
        -- jumping/rolling
        -- self.widthRadius = 7
        -- self.heightRadius = 14
    elseif name == "tails" then
        -- standing
        self.widthRadius = 9
        self.heightRadius = 15
        -- jumping/rolling
        -- self.widthRadius = 7
        -- self.heightRadius = 14
    elseif name == "knuckles" then
        -- gliding/climbing/sliding
        -- self.widthRadius = 10
        -- self.heightRadius = 10

        self.jumpForce = 6
    end
end

function Player:update(dt)
    local timeMult = 20 * dt
    local topSpeed = 6
    if self.onGround then
        local acceleration, deceleration = 0.046875 * timeMult, 0.5 * timeMult
        local friction = acceleration

        if love.keyboard.isDown(left) then
            if self.groundSpeed > 0 then
                self.groundSpeed = self.groundSpeed - deceleration
                if self.groundSpeed <= 0 then
                    self.groundSpeed = -0.5
                end
            elseif self.groundSpeed > -topSpeed then
                self.groundSpeed = self.groundSpeed - acceleration
                if self.groundSpeed <= -topSpeed then
                    self.groundSpeed = -topSpeed
                end
            end
        elseif love.keyboard.isDown(right) then
            if self.groundSpeed < 0 then
                self.groundSpeed = self.groundSpeed + deceleration
                if self.groundSpeed >= 0 then
                    self.groundSpeed = 0.5
                end
            elseif self.groundSpeed < topSpeed then
                self.groundSpeed = self.groundSpeed + acceleration
                if self.groundSpeed >= topSpeed then
                    self.groundSpeed = topSpeed
                end
            end
        else
            self.groundSpeed = self.groundSpeed -
                math.min(math.abs(self.groundSpeed), friction) * math.sign(self.groundSpeed)
        end

        local angle = math.rad(self.groundAngle)
        self.xSpeed = self.groundSpeed * math.cos(angle)
        self.ySpeed = self.groundSpeed * -math.sin(angle)
    else
        local airAcceleration = 0.09375 * timeMult
        local gravityForce = 0.21875 * timeMult

        if love.keyboard.isDown(left) then
            self.xSpeed = self.xSpeed - airAcceleration
        elseif love.keyboard.isDown(right) then
            self.xSpeed = self.xSpeed + airAcceleration
        end

        if self.ySpeed < 0 and self.ySpeed > -4 then
            self.xSpeed = self.xSpeed - self.xSpeed / 0.125 / 256
        end

        self.ySpeed = self.ySpeed + gravityForce
        if self.ySpeed > 16 then
            self.ySpeed = 16
        end
    end
    self.x = self.x + self.xSpeed
    self.y = self.y + self.ySpeed
end

return Player
