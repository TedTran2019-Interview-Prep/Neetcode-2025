# go through left dominos (set time to reach left)
# go through right dominos (set time to reach right)
# set it based on time to reach L/R, if same == keep as dot?
def final_dominos_state(dominos)
  new_dominos = Array.new(dominos.length)
  time_to_left = Array.new(dominos.length)
  time_to_right = Array.new(dominos.length)
  # Go left
  # Go in reverse direction <------
  time = nil
  dominos.reverse.each_with_index do |char, index|
    case char
    when '.'
      time += 1 unless time.nil?
    when 'R'
      time = nil
    when 'L'
      time = 0
    end

    time_to_left[index] = time
  end
  time_to_left.reverse!

  # Go right
  # Go in regular direction --->
  time = nil
  dominos.each_with_index do |char, index|
    case char
    when '.'
      time += 1 unless time.nil?
    when 'L'
      time = nil
    when 'R'
      time = 0
    end

    time_to_right[index] = time
  end

  dominos.length.times do |index|
    new_dominos[index] = if time_to_left[index].nil? && time_to_right[index].nil?
                           '.'
                         elsif time_to_left[index].nil?
                           'R'
                         elsif time_to_right[index].nil?
                           'L'
                         elsif time_to_left[index] == time_to_right[index]
                           '.'
                         elsif time_to_left[index] < time_to_right[index]
                           'L'
                         else
                           'R'
                         end
  end

  new_dominos
end

dominos = %w[. L . R .] # -> [L, L, ., R, R]
print final_dominos_state(dominos)
puts
dominos = %w[. R . . L .] # -> [., R, R, L, L, .]
print final_dominos_state(dominos)
puts
dominos = %w[. R . . . L .] # -> [., R, R, .,  L, L, .]
print final_dominos_state(dominos)
puts
dominos = %w[. R . L . L . R .] # -> [., R, ., L, L, L, ., R, R]
print final_dominos_state(dominos)
puts
