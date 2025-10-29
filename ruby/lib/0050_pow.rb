# frozen_string_literal: true

def my_pow(x, n)
  pow = lambda do |power|
    return 0 if x.zero?
    return 1 if power.zero?

    half_power = pow.call(power / 2)
    result = half_power * half_power
    power.odd? ? result * x : result
  end

  n.negative? ? 1.fdiv(pow.call(-n)) : pow.call(n)
end

def my_pow(x, n)
  pow = lambda do |power|
    return 0 if x.zero?
    return 1 if power.zero?

    half_power = pow.call(power / 2)
    result = half_power * half_power
    power.odd? ? result * x : result
  end

  negative = 1
  if n.negative?
    negative *= -1
    n *= -1
  end

  result = pow.call(n)
  negative.negative? ? 1.fdiv(result) : result
end
