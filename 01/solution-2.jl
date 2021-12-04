using DelimitedFiles
using Statistics

depths = readdlm("./02/input.txt")

moving_averages = [mean(depths[i:(i + 2)]) for i in 1:(length(depths) - 2)]

moving_averages_shifted = [moving_averages[2:end]..., -1]

increases = sum(moving_averages_shifted .> moving_averages)

println("Number of depth increases: $increases")
