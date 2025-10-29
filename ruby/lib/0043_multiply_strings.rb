# frozen_string_literal: true

def multiply(num1, num2)
  product = Array.new(num1.length + num2.length, 0)
  num1.reverse!
  num2.reverse!
  num1.each_char.with_index do |factor1, x|
    factor1 = factor1.to_i
    num2.each_char.with_index do |factor2, y|
      factor2 = factor2.to_i
      result = factor1 * factor2
      product[x + y] += result % 10
      product[x + y + 1] += result / 10
    end
  end
  product.each_with_index do |nbr, idx|
    if nbr > 9
      product[idx + 1] += nbr / 10
      product[idx] = nbr % 10
    end
  end
  product.pop while product[-1].zero? && product.length > 1
  product.reverse.join
end
