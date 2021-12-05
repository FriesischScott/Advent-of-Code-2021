using DelimitedFiles

commands = readdlm("./02/input.txt")

depth = 0
horizontal = 0
aim = 0

for c in eachrow(commands)
    if c[1] == "down"
        global aim += c[2]
    elseif c[1] == "up"
        global aim -= c[2]
    else
        global horizontal += c[2]
        global depth += c[2] * aim
    end
end

println("Horizontal times depth: $(depth * horizontal)")
