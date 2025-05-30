=begin
Using recursion, count the number of X in a string

Check every element of the string (either by slicing or sending in an index, adding 1 if found 0 if not)
=end

def countX(word)
  return 0 if word.empty? || word.nil?

  count = word[0] == 'x' ? 1 : 0
  count + countX(word[1..-1])
end

puts countX("xxhixx") == 4
puts countX("xhixhix") == 3
puts countX("hi") == 0
print(countX("xxhixx") == 4)
print(countX("xhixhix") == 3)
print(countX("hiX") == 0)
print(countX("XXXhXXX") == 0)
print(countX("x") == 1)
print(countX("") == 0)
print(countX("hihi") == 0)
print(countX("hiAAhi12hi") == 0)
