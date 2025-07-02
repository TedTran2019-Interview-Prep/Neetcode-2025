# frozen_string_literal: true

def is_n_straight_hand(hand, group_size)
  return false if hand.length % group_size != 0

  hand.sort!
  count = Hash.new(0)
  hand.each { |val| count[val] += 1 }

  hand.each do |value|
    next if count[value].zero?

    group_size.times do
      return false if count[value].zero?

      count[value] -= 1
      value += 1
    end
  end

  true
end

def is_n_straight_hand(hand, group_size)
  hand = hand.sort!
  count = Hash.new(0)
  hand.each { |val| count[val] += 1 }
  hand.each do |value|
    next if count[value].zero?

    current_size = 0
    until current_size == group_size
      return false if count[value].zero?

      current_size += 1
      count[value] -= 1
      value += 1
    end
  end

  true
end
