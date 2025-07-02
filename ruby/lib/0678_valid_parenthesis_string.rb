# frozen_string_literal: true

def check_valid_string(s)
  min_left = 0
  max_left = 0
  s.each_char do |char|
    if char == '('
      min_left += 1
      max_left += 1
    elsif char == ')'
      min_left -= 1 unless min_left.zero?
      max_left -= 1
      return false if max_left.negative?
    elsif char == '*'
      max_left += 1
      min_left -= 1 unless min_left.zero?
    end
  end
  0.between?(min_left, max_left)
end
