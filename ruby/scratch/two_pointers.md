# Sept 22, 2025: scratch work for quick review

## Valid Palindrome

convert string into lowercase + remove all non letters/numbers using regex
have pointer at start
pointer at back
until middle point is reached, (while start index < last)
    return false unless start == last
true

## Two Sum II - Input Array is Sorted

given [numbers] sorted in non-decreasing order
find 2 numbers add up to a target
return indices of two numbers added by 1
If it's sorted, we can use a L/R approach
[2 7 11 15], target = 9
left = 2, right = 15
if left + right == 9, return the indexes each added by 1
if left + right < 9, move the left pointer up
if left + right > 9, move the right pointer down
(Guaranteed 1 solution)
do while left < right just in case

## Three Sum

Return all triplets [i, j, k] === 0
NO DUPLICATE TRIPLETS, aka each number can only be used once
Sort the nums array
nums.each do |num, index|
    see if num + left + right == 0 by doing two sum sorted on rest of array
        left = index + 1, right = last ele

To skip duplicate answers, skip if nums[index] == nums[index - 1]
Don't traverse thru entire array, since you want to [...-3 -2 -1] after processing -3
Let's redo this one by hand <-- NEEDS REVIEW

```ruby
=begin
Let's do a quick redo
=end
def three_sum(nums)
    nums = nums.sort!
    triplets = []
    (0...nums.length - 2).each do |idx|
        next if idx.positive? && nums[idx] == nums[idx - 1]

        left = idx + 1
        right = nums.length - 1
        while left < right
            sum = nums[idx] + nums[left] + nums[right]
            if sum == 0
                triplets << [nums[idx], nums[left], nums[right]]
                left += 1
                right -= 1

                # Every time you get an answer, skip duplicates
                left += 1 while left < right && nums[left] == nums[left - 1]
                right -= 1 while left < right && nums[right] == nums[right + 1]
            elsif sum > 0
                right -= 1
            else
                left += 1
            end
        end
    end
    triplets
end
```

## Container with most water
