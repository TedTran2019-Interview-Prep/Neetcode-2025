=begin
given x, iterate x to 1
If x < 1, return empty array

return [] if x < 1
Generate full array of x to 1 and add to results
THen simply from the -1 array, remove elements until only one left and keep adding

Honestly an easier way might have been two loops?
5 times, go from 5-1.. 4-1... and so on
=end

def generate_sequence(target)
  return [] if target < 1

  results = []
  arr = target.downto(1).to_a
  results << arr
  until results[-1].length == 1
    new_arr = results[-1].dup
    new_arr.shift
    results << new_arr
  end
  results
end

puts generate_sequence(2) == [[2,1], [1]]
puts generate_sequence(3) == [[3,2,1], [2,1], [1]]
print(generate_sequence(0) == [[]] || generate_sequence(0) == [])
print(generate_sequence(1) == [[1]])
print(generate_sequence(2) == [[2,1], [1]])
print(generate_sequence(3) == [[3,2,1], [2,1], [1]])
print(generate_sequence(4) == [[4,3,2,1], [3,2,1], [2,1], [1]])
