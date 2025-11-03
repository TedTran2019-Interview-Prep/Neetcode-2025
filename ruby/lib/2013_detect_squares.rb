# frozen_string_literal: true

class DetectSquares
  def initialize
    @points = Hash.new(0)
  end

  #     :type point: Integer[]
  #     :rtype: Void
  def add(point)
    @points[point] += 1
  end

  #     :type point: Integer[]
  #     :rtype: Integer
  def count(point)
    px, py = point
    counts = 0
    print @points
    @points.each_key do |orig_point|
      x, y = orig_point
      next if px == x || py == y # Zero area
      next unless (px - x).abs == (py - y).abs # Square

      point_one = [x, py]
      point_two = [px, y]
      counts += @points[point_one] * @points[point_two] * @points[orig_point]
    end
    counts
  end
end
