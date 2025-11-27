# frozen_string_literal: true

def eval_rpn(tokens)
  stack = []
  expressions = %w[* + - /].to_set
  tokens.each do |token|
    if expressions.include?(token)
      eval2 = stack.pop
      eval1 = stack.pop
      case token
      when '*'
        stack << eval1 * eval2
      when '+'
        stack << eval1 + eval2
      when '/'
        # Ruby does float division then rounds down
        # We want to do float division then truncate
        stack << eval1.fdiv(eval2).truncate
      when '-'
        stack << eval1 - eval2
      end
    else
      stack << token.to_i
    end
  end
  stack.pop
end
