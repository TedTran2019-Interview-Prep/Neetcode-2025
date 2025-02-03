# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
module TopKFrequentElements
  # Time complexity: NlogN
  def self.sort_solution(nums, k)
    nums.tally.sort_by { |_k, v| -v }.take(k).map(&:first)
  end

  # Time complexity: N*K
  def self.max_by_solution(nums, k)
    nums.tally.max_by(k) { |_key, val| val }.map(&:first)
  end

  # Time complexity: KlogN
  def self.heap_solution(nums, k)
    count = nums.tally
    max_heap = Heap.new { |x, y| (x[1] > y[1]) }
    top_k = []

    count.each { |arr| max_heap << arr }
    k.times { top_k << max_heap.pop[0] }
    top_k
  end

  # Time complexity: N
  def self.bucket_solution(nums, k)
    count = nums.tally
    bucket = Array.new(nums.size + 1) { [] }
    count.each { |k, v| bucket[v] << k }
    top_k = []

    nums.size.downto(1) do |i|
      bucket[i].each do |nbr|
        top_k << nbr

        return top_k if top_k.size == k
      end
    end
    top_k
  end
end
