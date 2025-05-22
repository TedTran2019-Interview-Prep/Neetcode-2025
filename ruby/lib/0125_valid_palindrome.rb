# Could just do str_array == str_array.reverse instead of two pointer approach
# Can downcase first and not check for A-Z
# Without REGEX, have to check manually with 'a'..'z' and '0'..'9'
def is_palindrome(s)
  str_array = []
  s.each_char do |char|
    str_array << char.downcase if char.match?(/[a-zA-Z0-9]/)
  end
  left = 0
  right = str_array.length - 1
  while left < right
    return false unless str_array[left] == str_array[right]

    left += 1
    right -= 1
  end
  true
end
