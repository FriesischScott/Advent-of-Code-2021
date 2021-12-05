using DelimitedFiles

input = readlines("./03/input.txt")

bits = BitArray(undef, 1000, 12)

for (i, line) in enumerate(eachrow(input))
    bits[i, :] = parse.(Int, split(line[1], ""))
end

oxygen = copy(bits)
co2scrubber = copy(bits)

for position in 1:12
    most_common = sum(oxygen[:, position]) >= (size(oxygen, 1) / 2) ? 1 : 0
    global oxygen = oxygen[oxygen[:, position] .== most_common, :]
    if size(oxygen, 1) == 1
        break
    end
end

for position in 1:12
    least_common = sum(co2scrubber[:, position]) < (size(co2scrubber, 1) / 2) ? 1 : 0
    global co2scrubber = co2scrubber[co2scrubber[:, position] .== least_common, :]
    if size(co2scrubber, 1) == 1
        break
    end
end

function to_decimal(x::BitMatrix)
    decimal = 0
    l = length(x)
    for (i, j) in enumerate(x)
        decimal += j * 2^(l - i)
    end
    return decimal
end

oxygen = to_decimal(oxygen)
co2scrubber = to_decimal(co2scrubber)

println("Life support rating: $(oxygen * co2scrubber)")
