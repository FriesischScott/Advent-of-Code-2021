using DelimitedFiles

crabs = vec(readdlm("./07/input.txt", ',', Int64))

function minimum_fuel(c::Vector{Int64})
    left = min(c...)
    right = max(c...)

    fuel = Inf
    for p in left:right
        f = Int(sum([(n * (n + 1)) / 2 for n in abs.(c .- p)]))
        if f < fuel
            fuel = f
        end
    end
    return fuel
end

println("Minimum fuel: $(minimum_fuel(crabs))")
