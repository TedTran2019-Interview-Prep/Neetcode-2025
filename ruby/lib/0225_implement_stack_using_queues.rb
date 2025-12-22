# frozen_string_literal: true

class MyStack
  private attr_accessor :queue1, :queue2

  def initialize
    @queue1 = []
    @queue2 = []
  end

  def push(x)
    queue1 << x
  end

  def pop
    return nil if queue1.empty? && queue2.empty?

    if queue1.empty?
      queue1 << queue2.shift until queue2.length == 1
      queue2.shift
    else
      queue2 << queue1.shift until queue1.length == 1
      queue1.shift
    end
  end

  def top
    return nil if queue1.empty? && queue2.empty?

    top = nil
    if queue1.empty?
      queue1 << queue2.shift until queue2.length == 1
      top = queue2[0]
      queue1 << queue2.shift
    else
      queue2 << queue1.shift until queue1.length == 1
      top = queue1[0]
    end
    top
  end

  def empty
    queue1.empty? && queue2.empty?
  end
end
