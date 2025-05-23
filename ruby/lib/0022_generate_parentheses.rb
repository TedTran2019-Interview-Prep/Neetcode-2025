def generate_parenthesis(n)
  parentheses = []

  generate = lambda do |num_open, num_close, paren|
    return if num_close > num_open
    return if num_open > n

    parentheses << paren if num_open == n && num_close == num_open

    generate.call(num_open + 1, num_close, paren + '(')
    generate.call(num_open, num_close + 1, paren + ')')
  end

  generate.call(0, 0, '')
  parentheses
end
