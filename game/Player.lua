local Player = Object:extend()

Player.physicsConfig = {
    gravityForce = 0.21875,
    pushRadius = 10
}

function Player:new(name)
    self.name = name
    self.widthRadius = 9
    self.heightRadius = 19
    self.jumpForce = 6.5

    if name == "sonic" then
        -- jumping/rolling
        self.widthRadius = 7
        self.heightRadius = 14
    elseif name == "tails" then
        -- standing
        self.widthRadius = 9
        self.heightRadius = 15
        -- jumping/rolling
        self.widthRadius = 7
        self.heightRadius = 14
    elseif name == "knuckles" then
        -- gliding/climbing/sliding
        self.widthRadius = 10
        self.heightRadius = 10

        self.jumpForce = 6
    end
end

return Player
