=begin
String s consisting of alphanumeric chars and character '-'
Dashes act ONLY as separators (can appear anywhere, multiple in a row, start, end, etc)
Given positive integer K

Reformat so:
1. all letters uppercase
2. string split into groups separated by a single dash
3. each group contains exactly K characters (except the first group), which can be shorter but must contain at least 1 char

Recreate the string backwards
Just reverse at start, then reverse at end
Get k non-separator characters
Turn into a group, add a separator
Rinse and repeat, if finaly group doesn't hit length, whatever the last group can have anything from 1 to K
Assume all input is valid (first group is either gonna be 1 or K, 0 means the previous group is the first group and it has K chars)

Plan:
Reverse string
array = []
group_len = 0
iterate through string, for each char
  skip if separator

  add char to array
  increment group len
  if group_len == k
    add separator to array
    reset group len

if last char of array is a seperator, remove it
array.join.reverse
=end

def license_key_formatting(s, k)
  s.reverse!
  string_arr = []
  group_len = 0

  s.each_char do |char|
    next if char == '-'

    string_arr << char.upcase
    group_len += 1
    if group_len == k
      string_arr << '-'
      group_len = 0
    end
  end

  string_arr.pop if string_arr[-1] == '-'
  string_arr.join.reverse
end

puts license_key_formatting('5F3Z-2e-9-w', 4) == '5F3Z-2E9W'
puts license_key_formatting('2-5g-3-J', 2) == '2-5G-3J'
puts license_key_formatting('--a-a-a-a--', 2) == 'AA-AA'
puts license_key_formatting('----', 3) == ''
