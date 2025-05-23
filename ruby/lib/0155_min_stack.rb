class MinStack
  def initialize
    @stack = []
  end

  def push(val)
    min = @stack.empty? ? val : [@stack[-1][1], val].min
    @stack << [val, min]
  end

  def pop
    return nil if @stack.empty?

    @stack.pop[0]
  end

  def top
    return nil if @stack.empty?

    @stack[-1][0]
  end

  def get_min
    return nil if @stack.empty?

    @stack[-1][1]
  end
end
