# frozen_string_literal: true

def merge_triplets(triplets, target)
  satisfied = Array.new(3) { false }
  triplets.each do |triplet|
    next unless triplet.each_with_index.all? { |value, idx| value <= target[idx] }

    triplet.each_with_index { |value, idx| satisfied[idx] = true if value == target[idx] }
  end

  satisfied.all?
end
