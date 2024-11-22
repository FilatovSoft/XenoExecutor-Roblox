local a = 0
local b = 0

game:GetService('RunService').RenderStepped:Connect(function()
    local z = {}
    local screen = {}

    for i = 1, 7040 do
        z[i] = 0
    end

    for i = 1, 1760 do
        screen[i] = " "
    end

    local j = 0
    while j < 6.28 do
        j = j + 0.07
        local i = 0
        while i < 6.28 do
            i = i + 0.02

            local sinA = math.sin(a)
            local cosA = math.cos(a)
            local cosB = math.cos(b)
            local sinB = math.sin(b)

            local sini = math.sin(i)
            local cosi = math.cos(i)
            local cosj = math.cos(j)
            local sinj = math.sin(j)

            local cosj2 = cosj + 2
            local mess = 1 / (sini * cosj2 * sinA + sinj * cosA + 5)
            local t = sini * cosj2 * cosA - sinj * sinA

            local x = math.floor(40 + 30 * mess * (cosi * cosj2 * cosB - t * sinB))
            local y = math.floor(12 + 15 * mess * (cosi * cosj2 * sinB + t * cosB))
            local o = x + 80 * y
            local N = math.floor(8 * ((sinj * sinA - sini * cosj * cosA) * cosB - sini * cosj * sinA - sinj * cosA - cosi * cosj * sinB))

            if y > 0 and y < 22 and x > 0 and x < 80 and z[o] < mess then
                z[o] = mess
                screen[o] = string.sub('.,-~:;=!*#$@', math.max(N, 0) + 1, math.max(N, 0) + 1)
            end
        end
    end

    local output = {}
    for index = 1, #screen do
        table.insert(output, screen[index])
        if index % 80 == 0 then
            table.insert(output, '\n')
        end
    end

    print(table.concat(output))
    rconsoleprint(table.concat(output))

    a += 0.04
    b += 0.02
end)