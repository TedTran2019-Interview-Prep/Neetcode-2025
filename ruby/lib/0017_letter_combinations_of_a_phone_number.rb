# frozen_string_literal: true

# Think about how this works in terms of the decision tree.
def letter_combinations(digits)
  return [] if digits.empty?

  telephone_map = {
    '2' => 'abc',
    '3' => 'def',
    '4' => 'ghi',
    '5' => 'jkl',
    '6' => 'mno',
    '7' => 'pqrs',
    '8' => 'tuv',
    '9' => 'wxyz'
  }.freeze
  result = []

  dfs = lambda do |start, path|
    if path.length == digits.length
      result << path.join
      return
    end

    telephone_map[digits[start]].each_char do |char|
      path << char
      dfs.call(start + 1, path)
      path.pop
    end
  end

  dfs.call(0, [])
  result
end
