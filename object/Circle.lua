local Object = require "libraries/classic/classic"
local Circle = Object:extend()

function Circle:new(x, y, radius)
    self.x, self.y, self.radius = x, y, radius
    self.creation_time = love.timer.getTime()
end

function Circle:update(dt)
    print("Updating Circle")  -- 输出一些提示信息
    print("Current x:", self.x)  -- 输出 x 的值
    local a = 10
    print("Current y:", self.y)  -- 输出 y 的值
end

function Circle:draw()
    print("Drawing Circle")  -- 输出一些提示信息
    love.graphics.circle("fill", self.x, self.y, self.radius)
end

return Circle