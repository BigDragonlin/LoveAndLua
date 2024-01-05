local Object = require "libraries/classic/classic"
local Circle = Object:extend()

function Circle:new(x, y, radius)
    self.x, self.y, self.radius = x, y, radius
    self.creation_time = love.timer.getTime()
end

function Circle:update(dt)
    print("Updating Circle")  -- ���һЩ��ʾ��Ϣ
    print("Current x:", self.x)  -- ��� x ��ֵ
    local a = 10
    print("Current y:", self.y)  -- ��� y ��ֵ
end

function Circle:draw()
    print("Drawing Circle")  -- ���һЩ��ʾ��Ϣ
    love.graphics.circle("fill", self.x, self.y, self.radius)
end

return Circle