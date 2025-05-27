# A small optimization: no need for min_speed, the left pointer will point to the minimum once the loop is complete
def min_eating_speed(piles, h)
  left = 1
  right = piles.max

  while left <= right
    middle = (left + right) / 2
    hours = hours_to_eat(piles, middle)
    if hours > h
      left = middle + 1
    else
      right = middle - 1
    end
  end

  left
end

def min_eating_speed(piles, h)
  left = 1
  right = piles.max
  min_speed = Float::INFINITY

  while left <= right
    middle = (left + right) / 2
    hours = hours_to_eat(piles, middle)
    if hours > h
      left = middle + 1
    else
      min_speed = [min_speed, middle].min
      right = middle - 1
    end
  end

  min_speed
end

def hours_to_eat(piles, speed)
  piles.reduce(0) { |hours, pile| hours + pile.fdiv(speed).ceil }
end
