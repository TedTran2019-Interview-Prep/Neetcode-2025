# frozen_string_literal: true

def subsets(nums)
  subsets = []
  stack = []

  dfs = lambda do |start|
    subsets << stack.dup
    (start...nums.length).each do |index|
      stack << nums[index]
      dfs.call(index + 1)
      stack.pop
    end
  end

  dfs.call(0)
  subsets
end
