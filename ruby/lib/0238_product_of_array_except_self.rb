# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  left = 1
  output = []
  nums.reverse.each do |num|
    output << if output.empty?
                num
              else
                num * output[-1]
              end
  end
  output.reverse!

  nums.each_with_index do |num, index|
    right = output[index + 1] || 1
    output[index] = left * right
    left *= num
  end

  output
end
