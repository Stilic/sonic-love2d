local Player = Object:extend()

Player.physicsConfig = {
    gravityForce = 0.21875,
    pushRadius = 10
}

function Player:new(name, x, y)
    Player.super.new(self, x, y)

    self.name = name
    self.widthRadius = 9
    self.heightRadius = 19
    self.hitboxWidthRadius = 8
    self.hitboxHeightRadius = self.heightRadius - 3
    self.jumpForce = 6.5
    self.sprite = love.graphics.newImage("assets/images/sonic.png")

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

return Player
