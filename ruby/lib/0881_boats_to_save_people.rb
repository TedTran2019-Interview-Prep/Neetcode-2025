# frozen_string_literal: true

def num_rescue_boats(people, limit)
  people.sort!
  boats = 0
  left = 0
  right = people.length - 1
  while left < right
    if people[left] + people[right] <= limit
      boats += 1
      left += 1
      right -= 1
    elsif people[right] <= limit
      boats += 1
      right -= 1
    end
  end
  boats += 1 if left == right
  boats
end
