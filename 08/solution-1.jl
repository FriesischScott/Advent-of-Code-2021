input = readlines("./08/input.txt")

function count_digits(input::Vector{String})
    digits = 0

    for line in input
        _, values = split(line, " | ")
        values = split(values, " ")

        for v in values
            if length(v) in [2, 3, 4, 7]
                digits += 1
            end
        end
    end
    return digits
end

digits = count_digits(input)

println("Number of digits: $digits")
