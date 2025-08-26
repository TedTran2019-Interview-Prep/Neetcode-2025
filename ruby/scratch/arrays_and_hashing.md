# August 26, 2025: scratch work for quick review

## contains duplicate

given nums, return true if any value appears at least twice, otherwise false

1. convert nums into set, compare length of set to length of nums
2. use a hashmap, return false if any element is already encountered
O(N) time complexity, O(N) space complexity (set and hashmap) where N is number of elements in nums

## valid anagram

given two strings s/t, return true if it's an anagram
solution:
return false if lengths not the same
create a hashmap where values are initialized to 0
go through string s with index so can value into t as well
    add values of s to hashmap
    minus values of t from hashmap
go through hashmap and ensure all values are 0
O(N) time complexity, O(N) space complexity where N is number of elements in S and T

## two sum

given nums and integer target, return indices of two numbers so they add up to target
if you run into 2, and the target is 9, 9 - 2 = 7, you'd need a 7 to sum up to target
only one valid answer
solution:
create a hashmapy
go through the nums array w/ index
    if hashmap[nbr] exists,
        return [hashmap[nbr], index]

    hashmap[target - number] = index
return solutions array

## group anagrams

given an array of strs, group anagrams together
ruby has a group by method, can group by sorted strings, or do it manually
create a hashmap
iterate through array of strs
    sort str
    add original unsorted str to hashmap of str
return hashmap's values
time complexity is n * nlogn, space is n
Can also instead of using sorted str as keys, can use hashmap as keys and not sort...
But that solution takes a bit more effort. (It is intuitive for a Rubyist though)

## Top K Frequent Elements

given nums and integer k, return k most frequent elements
must run better than nlogn
k is in the range of 1 to # of unique elements in array
Solution:
count number of occurrences of each element
create an array of size of nums + 1, where each index is an array
create answers array
iterate through count, k/v
    add key to bucket of array[v]
iterate from last index in array
    add numbers found to answers array until answers.size == k
return answers

## encode and decode strings

design algorithm to encode a list of strings to a single string
encode, decode
encode:
single str = ''
go through the array of strs
    for each string, add number of chars + delimiter + chars itself
    e.g [neet code love you] becomes '4#neet4#code4#love3#you'
decode:
array = []
go through the single string
    pick characters between index and up til' #, convert into number
    skip past #
    read that amount of number characters and put into array
    rinse and repeat until done

## product of array except self

given nums, return answer such that answer[i] is equal to product of nums except nums[i]
guaranteed to fit within 32 bit integer, must run in O(N) time without division operation
think about how 0 is handled
[1, 2, 3, 4]
solution:
left to right:
1, 2, 6, 12
right to left:
24 24 12 4
If you're at 0 index, you want -1 (out of bounds just consider as 1) *24
If you're at 1 index, you want 1* 12 = 12
If you're at 2 index, you want 2 *4
If you're at 3 index, you want 6* 1
How would you do this in O(1) space complexity?
create right to left as output array
[24, 24, 12, 4]
for left to right, just a variable is enough
1 -> 2 -> 6 -> 12 as you go along
replace current value in output w/ variable * 1 index to right in output array

## valid sudoku

determine if a 9x9 board sudoku board is valid
each row must contain 1-9 no repetition
each column must contain 1-9 no repetition
each 3x3 box must contain digits 1-9 no repetition
simulation problem
iterate through board, row, row_idx
    return false if row isn't valid
    column = []
    iterate through row, col_idx
        add board[col][row] to column
    return false if column isn't valid
hard part: checking each 3x3 box
[0, 3, 6].each do |curr row|
    [0, 3, 6].each do |curr col|
        square = []
        curr row to curr row + 3 do row
            curr col to curr col + 3 do col
                add to square
        return false unless square valid

check valid function:
if there's any repeated or non 1-9 digits, return false

## longest consecutive sequence

given unsorted array of integer nums, return length of longest consecutive elmeents sequence
must run in o(N)
numbers can start at any point
solution:
convert nums to a set
max = 0
nums.each do nums
    if set[nums - 1] exists, skip not start of set
    otherwise... do a loop that does nums + 1 until value no longer found in set
    store count result and compare with max
