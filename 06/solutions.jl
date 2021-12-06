using DelimitedFiles
using DataStructures
using ProgressMeter

lanternfish = vec(readdlm("./06/input.txt", ',', Int8))

fish = Dict{Int,Int}()

for i in 0:8
    fish[i] = sum(lanternfish .== i)
end

function simulate_lanternfish(fish::Dict{Int,Int}, days_to_simulate::Integer)
    f = copy(fish)
    for _ in 1:days_to_simulate
        births = f[0]
        for i in 1:8
            f[i - 1] = f[i]
        end
        f[6] += births
        f[8] = births
    end
    return sum([f[i] for i in 0:8])
end

println("Solution 1: $(simulate_lanternfish(fish, 80))")
println("Solution 2: $(simulate_lanternfish(fish, 256))")
