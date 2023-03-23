local Player = BaseObject:new()

function Player:new(name)
    self.name = name
    self.widthRadius = 9
    self.heightRadius = 19
    self.pushRadius = 10
    self.slopeFactor = 0
    self.jumpForce = 6.5
    self.gravityForce = 0.21875

    if name == "sonic" then
    elseif name == "tails" then
        -- standing
        self.widthRadius = 9
        self.heightRadius = 15
    elseif name == "knuckles" then
        self.jumpForce = 6
    end
end

return Player
