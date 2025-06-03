def num_rabbits(answers)
    count_rabbits = answers.tally
    min_rabbits = 0

    answers.uniq.each do |answer|
        if count_rabbits[answer] <= answer + 1
            min_rabbits += answer + 1
        else
            min_rabbits += count_rabbits[answer].fdiv(answer + 1).ceil * (answer + 1)
        end
    end

    min_rabbits
end
