Object = require 'libraries/classic/classic'

-------------自动化require-----------------------------------
function love.load()
    local object_files = {}
    recursiveEnumerate('object', object_files)
    requireFiles(object_files)
end

function recursiveEnumerate(folder, file_list)
    local items = love.filesystem.getDirectoryItems(folder)
    for _, item in ipairs(items) do
        local file = folder .. '/' .. item
        if love.filesystem.isFile(file) then
            table.insert(file_list, file)
        elseif love.filesystem.isDirectory then
            recursiveEnumerate(file, file_list)
        end
    end
end

function requireFiles(files)
    for _, file in ipairs(files) do
        --这里的file:sub()是怎么用的
        local file = file:sub(1, -5)
        require(file)
    end
end
------------------------------------------------

function love.draw()
    print("test")
    love.graphics.print("Hello World", 400, 300)
end

function love.run()
    ---在lua中，除了false和nil，其他都是true
    if love.math then
        love.math.setRandomSeed(os.time()) --随机数种子
    end

    if love.load and love.load(arg) then end

    if love.timer then
        love.timer.step()
    end

    local dt = 0

    -- Main loop time.
    while true do
        -- Process events.
        if love.event then
            love.event.pump() --处理事件
            for name, a, b, c, d, e, f in love.event.poll() do
                if name == "quit" then
                    if not love.quit or not love.quit() then
                        return a
                    end
                end
                love.handlers[name](a, b, c, d, e, f)
            end
        end
    end

    if love.timer then
        love.timer.step()
        dt = love.timer.getDelta()
    end

    if love.update then
        love.update(dt)
    end

    if love.graphics and love.graphics.isActive() then
        love.graphics.clear(love.graphics.getBackgroundColor())
        love.graphics.origin()
        if love.draw then love.draw() end
        love.graphics.present()
    end

    if love.timer then love.timer.sleep(0.001) end
end