input = readlines("./08/input.txt")

function sum_outputs(input::Vector{String})
    output = 0

    for line in input
        pattern, values = split(line, " | ")

        pattern = map(p -> join(sort(collect(p))), sort(split(pattern, " "); by=length))
        values = map(p -> join(sort(collect(p))), split(values, " "))

        d = Dict(
            pattern[1] => "1", pattern[2] => "7", pattern[3] => "4", pattern[10] => "8"
        )

        three = filter(p -> contains_all_characters(pattern[1], p), pattern[4:6])[1] # contains 1
        d[three] = "3"
        nine = filter(p -> includes_all_digits([pattern[2:3]..., three], p), pattern[7:9])[1] # contains 3, 4, 7
        d[nine] = "9"
        null = filter(
            p ->
                contains_all_characters(pattern[2], p) &&
                    !contains_all_characters(pattern[3], p),
            pattern[7:9],
        )[1]# contains 7 but not 4
        d[null] = "0"

        two = filter(p -> !contains_all_characters(p, nine), pattern[4:6])[1] # 9 3 and 5 but not 2
        d[two] = "2"

        five = filter(p -> p != two && p != three, pattern[4:6])[1] # remaining length 5 digit
        d[five] = "5"

        six = filter(p -> p ∉ keys(d), pattern[7:9])[1] # last remaining digit
        d[six] = "6"

        output += parse(Int, join(map(v -> d[v], values)))
    end
    return output
end

function contains_all_characters(a::String, b::String)
    return all([s in b for s in collect(a)])
end

function includes_all_digits(a::Vector{String}, b::String)
    return all([contains_all_characters(s, b) for s in a])
end

digits = sum_outputs(input)

println("Sum of outputs: $digits")
