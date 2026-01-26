# Working solution
def open_lock(deadends, target)
  deadends = deadends.to_set
  return 0 if target == '0000'
  return -1 if deadends.include?('0000')

  queue = []
  queue << ['0000', 0]
  until queue.empty?
    lock, moves = queue.shift

    generate_combinations(lock).each do |combination|
      next if deadends.include?(combination)

      return moves + 1 if combination == target

      queue << [combination, moves + 1]
      deadends << combination
    end
  end
  -1
end

def generate_combinations(lock)
  combinations = []
  lock.each_char.with_index do |char, idx|
    copy = lock.dup
    copy[idx] = ((char.to_i + 1) % 10).to_s
    combinations << copy
    copy = lock.dup
    copy[idx] = ((char.to_i - 1) % 10).to_s
    combinations << copy
  end
  combinations
end

# Entirely wrong solution with lots of string duplication and manipulation
def open_lock(deadends, target)
  return 0 if target == '0000'

  deadends = deadends.to_set
  min_heap = Heap.new { |a, b| a[2] < b[2] } # lock, solved, moves
  min_heap << ['0000', false, 0]
  until min_heap.empty?
    lock, solved, moves = min_heap.pop
    return moves if solved

    lock.each_char.with_index do |nbr, idx|
      next if nbr == target[idx]

      closewise = rotate_clockwise(nbr.to_i, target[idx].to_i, deadends, lock.dup, idx)
      counter = rotate_counter_clockwise(nbr.to_i, target[idx].to_i, deadends, lock.dup, idx)
      min_moves = [closewise, counter].min
      next if min_moves == Float::INFINITY

      new_lock = lock.dup
      new_lock[idx] = target[idx]
      solved = true if new_lock == target
      min_heap << [new_lock, solved, moves + min_moves]
    end
  end
  -1
end

def rotate_clockwise(nbr, target, deadends, lock, idx)
  moves = 0
  while nbr != target
    nbr = (nbr + 1) % 10
    moves += 1
    lock[idx] = nbr.to_s
    return Float::INFINITY if deadends.include?(lock)
  end
  moves
end

def rotate_counter_clockwise(nbr, target, deadends, lock, idx)
  moves = 0
  while nbr != target
    nbr = (nbr - 1) % 10
    moves += 1
    lock[idx] = nbr.to_s
    return Float::INFINITY if deadends.include?(lock)
  end
  moves
end
