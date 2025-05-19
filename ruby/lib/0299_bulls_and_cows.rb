def get_hint(secret, guess)
  cows = 0
  bulls = 0
  secret_count = Hash.new(0)
  guess_count = Hash.new(0)

  guess.each_char.with_index do |guess_char, index|
    if guess_char == secret[index]
      bulls += 1
    else
      guess_count[guess_char] += 1
      secret_count[secret[index]] += 1
    end
  end

  guess_count.each do |guess_char, guess_amount|
    cows += [guess_amount, secret_count[guess_char]].min
  end

  "#{bulls}A#{cows}B"
end
