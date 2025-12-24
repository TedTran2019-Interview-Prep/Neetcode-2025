# frozen_string_literal: true

def simplify_path(path)
  stack = []
  split_path = path.split('/')
  split_path.each do |part|
    next if part.empty? || part == '.'

    if part == '..'
      stack.pop
    else
      stack << part
    end
  end
  "/#{stack.join('/')}"
end
