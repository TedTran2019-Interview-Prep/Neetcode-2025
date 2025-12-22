# frozen_string_literal: true

class MyQueue
  def initialize
    @push_stack = []
    @pop_stack = []
  end

  def push(x)
    @push_stack << x
  end

  def pop
    @pop_stack << @push_stack.pop until @push_stack.empty? if @pop_stack.empty?

    @pop_stack.pop
  end

  def peek
    @pop_stack << @push_stack.pop until @push_stack.empty? if @pop_stack.empty?

    @pop_stack[-1] # Peek
  end

  def empty
    @push_stack.empty? && @pop_stack.empty?
  end
end
