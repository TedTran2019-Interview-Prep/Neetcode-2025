# frozen_string_literal: true

class MedianFinder
  def initialize
    @left = Heap.new(:>) # Max heap
    @right = Heap.new # Min heap, the default
  end

  def add_num(num)
    if @right.empty? || num >= @right.peek
      @right << num
    else
      @left << num
    end
  end

  def find_median
    balance # Can balance in find_median or add_num, doesn't matter.
    if (@right.length + @left.length).even?
      (@right.peek + @left.peek).fdiv(2)
    else
      @right.peek
    end
  end

  private

  def balance
    return if @right.length == @left.length || @right.length == @left.length + 1

    until @right.length == @left.length || @right.length == @left.length + 1
      if @right.length > @left.length
        @left << @right.pop
      else
        @right << @left.pop
      end
    end
  end
end
