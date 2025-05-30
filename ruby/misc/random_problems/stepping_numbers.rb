# Stepping number = every pair of adjacent base-10 digits has a difference of exactly 1
# Single digit numbers are ALL stepping stone numbers
# 3, 12, 5676 are all stepping stone numbers
# Given inclusive min, max find all stepping stone numbers in that range and return them in a sorted order
#
# This probably is actually just like "Numbers With Same Consecutive Differences"
# For the zero case, you probably want to skip if the entire value is zero, so let's try coding this
#
# It's a permutation problem with many answers
# Are all numbers positive?
# Manually add 0 if starting from 0
# Else, do (1..9) then see possible options for next
# Length is not needed since we'll bail when greater than high
#
# Plan:
# results = []
#
# dfs = lambda do |num|
#   return if num > high
#   results << num if num.between?(low, high)
#
#   last digit = num % 10
#   next_digits = [last_digit - 1, last_digit + 1]
#   next_digits.each do next_digit
#     next unless next_digit.between?(0, 9)
#
#     dfs.call(num * 10 + next_digit)
#
# Edge case
# results << 0 if low.zero?
# (1..9).each { |start| dfs.call(start) }
# results
#
# A BFS solution would handle this without needing to sort...
# Plan:
# Create a queue and add (1..9) to it
# results = []
# add 0 to results if low is zero
# until queue is empty
#   num = pop from queue
#   next if nbr > high
#
#   add num to results if between low, high
#   get last digit of nbr
#   find next possible digits
#   for the next possible digits
#     next if they aren't between 0-9
#     else add num * 10 + that digit to the queue
# results

# BFS solution (No need to sort!)
def stepping_numbers(low, high)
  results = []
  queue = Queue.new
  results << 0 if low.zero?
  (1..9).each { |start| queue << start }
  until queue.empty?
    num = queue.pop
    next if num > high

    results << num if num.between?(low, high)
    last_digit = num % 10
    next_digits = [last_digit - 1, last_digit + 1]
    next_digits.each do |next_digit|
      next unless next_digit.between?(0, 9)

      queue << num * 10 + next_digit
    end
  end
  results
end

# DFS solution
def stepping_numbers(low, high)
  results = []

  dfs = lambda do |num|
    return if num > high

    results << num if num.between?(low, high)

    last_digit = num % 10
    next_digits = [last_digit - 1, last_digit + 1]
    next_digits.each do |next_digit|
      next unless next_digit.between?(0, 9)

      dfs.call(num * 10 + next_digit)
    end
  end

  results << 0 if low.zero?
  (1..9).each { |start| dfs.call(start) }
  results.sort
end
