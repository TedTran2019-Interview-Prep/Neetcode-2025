def eval_rpn(tokens)
  stack = []
  operators = %w[+ - / *].to_set
  tokens.each do |token|
    if operators.include? token
      second = stack.pop
      first = stack.pop
      case token
      when '+'
        stack << first + second
      when '-'
        stack << first - second
      when '/'
        stack << first.fdiv(second).truncate
      when '*'
        stack << first * second
      end
    else
      stack << token.to_i
    end
  end

  stack[0]
end
