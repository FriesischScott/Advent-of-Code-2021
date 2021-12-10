using Statistics

lines = readlines("./10/input.txt")

pairs = Dict(')' => '(', ']' => '[', '}' => '{', '>' => '<')

scores_corrupted = Dict(')' => 3, ']' => 57, '}' => 1197, '>' => 25137)
scores_incomplete = Dict('(' => 1, '[' => 2, '{' => 3, '<' => 4)

function iscorrupted(line::String)
    chunk = []

    for c in collect(line)
        if c in ['(', '[', '{', '<']
            push!(chunk, c)
            continue
        end

        if pairs[c] == chunk[end]
            chunk = chunk[1:(end - 1)]
        else
            return true, scores[c]
            break
        end
    end
    return false, 0
end

function syntax_errors(lines::AbstractVector{String})
    result = 0
    for l in lines
        corrupted, score = iscorrupted(l)
        if corrupted
            result += score
        end
    end
    return result
end

function score_incomplete_line(line::String)
    chunk = []
    for c in collect(line)
        if c in ['(', '[', '{', '<']
            push!(chunk, c)
        else
            chunk = chunk[1:(end - 1)]
        end
    end
    score = 0
    for c in reverse(chunk)
        score = score * 5 + scores_incomplete[c]
    end
    return score
end

println("Syntax error score: $(syntax_errors(lines))")

incomplete_lines = filter(l -> !iscorrupted(l)[1], lines)

middle_score = Int(median([score_incomplete_line(line) for line in incomplete_lines]))

println("Middle score: $middle_score")
