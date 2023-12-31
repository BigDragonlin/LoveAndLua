--使用这种local require方式不会污染全局表
local Test = Object:extend()

function Test:new()

end

function Test:update(dt)
    
end

function Test:draw()

end

return Test