def is_valid(s)
  stack = []
  pairs = {
    ')' => '(',
    ']' => '[',
    '}' => '{'
  }
  open_parens = pairs.values.to_set
  s.each_char do |char|
    if open_parens.include? char
      stack << char
    else
      return false unless pairs[char] == stack.pop
    end
  end
  stack.empty?
end
