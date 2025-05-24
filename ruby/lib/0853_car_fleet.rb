# Cleanup
# Use zip instead of manually constructing array of pos + speed
# Use better variable names
# Put last_time at 0 because that's the lowest and start fleets at 0 instead
# Aka first value overrides 0 and adds to fleets
# Sort position from highest to lowest, then go left to right to simplify matters
# E.g, sorting low to high then going back to front, or sorting high to low then going front to back.
def car_fleet(target, position, speed)
  cars = position.zip(speed).sort_by { |pos, _| -pos }
  fleets = 0
  last_time = 0

  cars.each do |pos, spd|
    time = (target - pos).to_f / spd
    if time > last_time
      fleets += 1
      last_time = time
    end
  end

  fleets
end

def car_fleet(target, position, speed)
  fleets = 1
  min = nil
  pos_speed = []
  position.each_with_index { |pos, idx| pos_speed << [pos, speed[idx]] }
  sorted_pos_speed = pos_speed.sort_by { |tuple| tuple[0] }
  print sorted_pos_speed
  (sorted_pos_speed.length - 1).downto(0).each do |idx|
    speed_value = sorted_pos_speed[idx][1]
    position_value = sorted_pos_speed[idx][0]
    rounds = (target - position_value).fdiv(speed_value)
    if min.nil?
      min = rounds
    elsif rounds > min
      fleets += 1
      min = rounds
    end
  end

  fleets
end
