# frozen_string_literal: true

def can_complete_circuit(gas, cost)
  return -1 unless gas.sum >= cost.sum

  total = 0
  starting_index = 0
  (0...gas.length).each do |idx|
    total += gas[idx] - cost[idx]
    if total.negative?
      total = 0
      starting_index = idx + 1
    end
  end
  starting_index
end
