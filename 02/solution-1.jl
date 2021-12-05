using DelimitedFiles

commands = readdlm("./02/input.txt")

horizontal = sum(commands[commands[:, 1] .== "forward", 2])

up = sum(commands[commands[:, 1] .== "up", 2])
down = sum(commands[commands[:, 1] .== "down", 2])

depth = down - up

println("Horizontal times depth: $(depth * horizontal)")
