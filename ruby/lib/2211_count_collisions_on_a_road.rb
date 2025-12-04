# frozen_string_literal: true

# I really need to master REGEX...
def count_collisions(directions)
  directions.gsub!(/^L+/, '')
  directions.gsub!(/R*$/, '')
  directions.length - directions.count('S')
end

def count_collisions(directions)
  collisions = 0
  flag = -1
  directions.each_char do |dir|
    case dir
    when 'L'
      if flag > -1
        # Left car slams into wall (0) or slams into a right moving car (1 + 1),
        # then the rest of the right moving cars slam into the resulting wall
        collisions += flag + 1
        flag = 0
      end
    when 'R'
      flag = (flag == -1 ? 1 : flag + 1)
    when 'S'
      # All right moving cars slammed into stopped car
      collisions += flag if flag > -1 # If only left moving cars, nothing slams
      flag = 0
    end
  end
  collisions
end

def count_collisions(directions)
  stack = []
  collisions = 0
  directions.each_char do |dir|
    if stack[-1] == 'R' && dir == 'L'
      collisions += 2
      stack.pop
      stack << 'S'
    elsif stack[-1] == 'R' && dir == 'S'
      stack.pop
      stack << 'S'
      collisions += 1
    elsif stack[-1] == 'S' && dir == 'L'
      collisions += 1
    else
      stack << dir
    end
  end

  rights = 0
  stack.each do |dir|
    if dir == 'R'
      rights += 1
    elsif dir == 'S'
      collisions += rights
      rights = 0
    end
  end
  collisions
end
