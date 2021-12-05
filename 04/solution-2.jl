using DelimitedFiles

numbers = parse.(Int, split(readlines("./04/numbers.txt")[1], ","))

boards = Int.(readdlm("./04/boards.txt"))
boards = reshape(boards', 5, 5, div(size(boards, 1), 5)) # transpose to make the reshape work

state = fill(false, size(boards))

winners = []
score = 0
for n in numbers
    state[boards .== n] .= true

    # check boards that haven't won yet
    for b in filter(x -> x ∉ winners, 1:size(boards, 3))
        row = any(vec(sum(state[:, :, b]; dims=1)) .== 5)
        column = any(vec(sum(state[:, :, b]; dims=2)) .== 5)

        if row || column
            push!(winners, b)
            global score = sum(boards[:, :, b][.!state[:, :, b]]) * n
        end
    end
end

println("Final score: $score")
