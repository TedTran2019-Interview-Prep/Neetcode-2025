# frozen_string_literal: true

def asteroid_collision(asteroids)
  stack = []
  asteroids.each do |asteroid|
    if asteroid.positive?
      stack << asteroid
      next
    end

    loop do
      if stack.empty? || stack[-1].negative?
        stack << asteroid
        break
      elsif stack[-1] == asteroid.abs
        stack.pop
        break
      elsif stack[-1] < asteroid.abs
        stack.pop
      else
        break
      end
    end
  end
  stack
end
