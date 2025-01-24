# frozen_string_literal: true

# def contains_duplicate(nums)
# @param {Integer[]} nums
# @return {Boolean}
module ContainsDuplicate
  require 'set'

  # Solution 1: Using a hash to track seen numbers
  # O(N) time and space complexity
  def self.solution_one(nums)
    seen = {}

    nums.any? do |num|
      seen.key?(num) || (seen[num] = true
                          false)
    end
  end

  # Solution 2: Using a set to check for duplicates
  # O(N) time and space complexity
  def self.solution_two(nums)
    nums.size != Set.new(nums).size
  end
end

if __FILE__ == $PROGRAM_NAME
  require 'benchmark'
  require 'benchmark/memory'

  nums = (1..100_000).to_a + [1] # Array with a duplicate

  puts "Time Benchmark:"
  Benchmark.bm do |x|
    x.report('Solution 1:') { ContainsDuplicate.solution_one(nums) }
    x.report('Solution 2:') { ContainsDuplicate.solution_two(nums) }
  end

  puts "\nMemory Benchmark:"
  Benchmark.memory do |x|
    x.report('Solution 1:') { ContainsDuplicate.solution_one(nums) }
    x.report('Solution 2:') { ContainsDuplicate.solution_two(nums) }
    x.compare!
  end
end
