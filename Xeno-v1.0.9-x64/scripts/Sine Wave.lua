local RunService = game:FindService("RunService")

local t = 0
local amount = 0
local characters = {"*", "-", "~", ".", "o", "+", "x", "#", "%", "@", "&", "$", "^", "=", "!"}


RunService.RenderStepped:Connect(function()
    local screen = {}
    for i = 1, 1760 do
        screen[i] = " "
    end

    local amplitude = 12
    local frequency = 0.06

    for x = 0, 80*(amount >= 1 and amount or 1) do
        local y = math.floor(12 + amplitude * math.sin((x + t) * frequency))
        local char = characters[(x % #characters) + 1]

        for offset = -2, 2 do
            local index = x + (y + offset) * 80
            if index > 0 and index <= #screen then
                screen[index] = char
            end
        end
    end

    local output = {}
    for index = 1, #screen do
        table.insert(output, screen[index])
        if index % 80 == 0 then
            table.insert(output, "\n")
        end
    end

    print("\n" .. table.concat(output))
    rconsoleprint("\n" .. table.concat(output))

    t += 1
end)