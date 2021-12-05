using DelimitedFiles

input = readlines("./03/input.txt")

bits = BitArray(undef, 1000, 12)

for (i, line) in enumerate(eachrow(input))
    bits[i, :] = parse.(Int, split(line[1], ""))
end

gamma = vec(sum(bits; dims=1) .> 500)
epsilon = .!gamma

function to_decimal(x::BitVector)
    decimal = 0
    l = length(x)
    for (i, j) in enumerate(x)
        decimal += j * 2^(l - i)
    end
    return decimal
end

gamma = to_decimal(gamma)
epsilon = to_decimal(epsilon)

println("Power consumption: $(gamma * epsilon)")
