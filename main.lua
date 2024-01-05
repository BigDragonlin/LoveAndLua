require "libraries/Input/Input"
function love.load()
    input = Input()
    input:bind('mouse1', 'test')
end

function love.update(dt)
    if input:pressed('test') then print('pressed') end
    if input:released('test') then print('released') end
    if input:down('test') then print('down') end
end