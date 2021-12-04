using DelimitedFiles

depths = readdlm("./01/input.txt")

depths_shifted = [depths[2:end]..., -1]

increases = sum(depths_shifted .> depths)

println("Number of depth increases: $increases")
