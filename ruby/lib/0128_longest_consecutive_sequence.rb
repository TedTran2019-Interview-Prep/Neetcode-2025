# def longest_consecutive(nums)
#     return nums.length if nums.length <= 1

#     exist = {}
#     nums.each { |num| exist[num] = true }
#     count = {}
#     already_visited = {}
#     longest = 0
#     nums.each do |nbr|
#         next if already_visited[nbr]

#         tally = 1
#         next_number = nbr + 1
#         already_visited[nbr] = true
#         while exist[next_number]
#             if count[next_number]
#                 tally += count[next_number]
#                 break
#             else
#                 tally += 1
#                 already_visited[next_number] = true
#                 next_number += 1
#             end
#         end
#         count[nbr] = tally
#         longest = [tally, longest].max
#     end

#     longest
# end

require 'set'

def longest_consecutive(nums)
  return nums.length if nums.length <= 1

  nums_set = nums.to_set
  longest = 0
  already_visited = Set.new

  nums.each do |num|
    next if nums_set.include?(num - 1) # Only counts if it's the start of a sequence
    next if already_visited.include?(num)

    already_visited.add(num)
    next_number = num + 1
    streak = 1
    while nums_set.include?(next_number)
      streak += 1
      next_number += 1
    end

    longest = [streak, longest].max
  end

  longest
end
