# No Leetcode premium RIP
def encode(strings)
  encoded_string = ''
  strings.each do |string|
    encoded_string << "#{string.length}##{string}"
  end
  encoded_string
end

def decode(string)
  decoded_strings = []
  index = 0
  while index < string.length
    num_characters = ''
    unless string[index] == '#'
      num_characters << string[index]
      index += 1
    end
    num_characters = num_characters.to_i
    index += 1
    decoded_strings << string[index...index + num_characters]
    index += num_characters
  end

  print decoded_strings
  decoded_strings
end
