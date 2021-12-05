input = readlines("./05/input.txt")

lines = zeros(Int64, length(input), 4)

for (i, line) in enumerate(input)
    coordinates = split(line, " -> ")
    x1, y1 = parse.(Int, split(coordinates[1], ","))
    x2, y2 = parse.(Int, split(coordinates[2], ","))

    lines[i, :] = [x1, y1, x2, y2] .+ 1
end

floor = zeros(Int64, maximum(lines[:, [2, 4]]), maximum(lines[:, [1, 3]]))

for l in eachrow(lines)
    if l[1] == l[3]
        x = l[1]
        y = l[2] < l[4] ? (l[2]:l[4]) : (l[4]:l[2])
    elseif l[2] == l[4]
        y = l[2]
        x = l[1] < l[3] ? (l[1]:l[3]) : (l[3]:l[1])
    else
        continue
    end
    floor[y, x] .+= 1
end

overlaps = sum(floor .>= 2)

println("Number of overlaps: $overlaps")
