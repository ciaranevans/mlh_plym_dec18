levelLoading = {}

function levelLoading:loadLevel(levelPath)
    levelLines = readInLines(levelPath)
    levelLines = splitLines(levelLines)
    printLevel(levelLines)
    return levelLines
end

function readInLines(csvPath)
    lines = {}
    for line in love.filesystem.lines(csvPath) do
        table.insert(lines, line)
    end
    return lines
end

function splitLines(levelLines)
    splitlevellines = {}
    for entry, line in pairs(levelLines) do
        splitline = {}
        for item in string.gmatch(line, '%d') do
            if item == '0' then
                table.insert(splitline, 'blank')
            else
                table.insert(splitline, 'grass')
            end
        end
        table.insert(splitlevellines, splitline)
    end
    return splitlevellines
end

function printLevel(level)
    for k, v in pairs(level) do
        string = ''
        for k1, v1 in pairs(v) do
            string = string .. v1
        end
        print(string)
    end
end

return levelLoading