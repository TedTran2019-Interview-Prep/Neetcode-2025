require 'rspec'
require_relative '../misc/heap'

RSpec.describe Heap do
  let(:min_heap) { Heap.new(:<) }
  let(:max_heap) { Heap.new(:>) }

  describe '#add and #pop' do
    it 'maintains min-heap property' do
      [5, 3, 8, 1, 2].each { |n| min_heap.add(n) }
      result = []
      result << min_heap.pop until min_heap.empty?
      expect(result).to eq([1, 2, 3, 5, 8])
    end

    it 'maintains max-heap property' do
      [5, 3, 8, 1, 2].each { |n| max_heap.add(n) }
      result = []
      result << max_heap.pop until max_heap.empty?
      expect(result).to eq([8, 5, 3, 2, 1])
    end
  end

  describe '#peek' do
    it 'returns the top element without removing it' do
      min_heap.add(10).add(2).add(7)
      expect(min_heap.peek).to eq(2)
      expect(min_heap.size).to eq(3)
    end
  end

  describe '#replace' do
    it 'replaces the root and rebalances' do
      min_heap.add(1).add(3).add(5)
      min_heap.replace(4)
      expect(min_heap.peek).to eq(3)
    end
  end

  describe '#offer' do
    it 'replaces root only if new element is greater in min-heap' do
      min_heap.add(1).add(2).add(3)
      result = min_heap.offer(5)
      expect(result).to eq(1)
      expect(min_heap.peek).to eq(2)
    end

    it 'does not replace root if new element is not greater' do
      min_heap.add(1).add(2).add(3)
      result = min_heap.offer(0)
      expect(result).to eq(0)
      expect(min_heap.peek).to eq(1)
    end
  end

  describe '#clear' do
    it 'empties the heap' do
      min_heap.add(5).add(10)
      min_heap.clear
      expect(min_heap.empty?).to be true
      expect(min_heap.size).to eq(0)
    end
  end

  describe '#heapify' do
    it 'turns an unsorted array into a heap' do
      heap = Heap.new(:<).heapify([9, 4, 7, 1, -2, 6, 5])
      result = []
      result << heap.pop until heap.empty?
      expect(result).to eq([-2, 1, 4, 5, 6, 7, 9])
    end
  end

  describe '#to_a' do
    it 'returns the current heap array up to @size' do
      min_heap.add(4).add(1).add(7)
      expect(min_heap.to_a.sort).to eq([1, 4, 7])
    end
  end

  describe 'Enumerable support' do
    it 'responds to #map' do
      min_heap.add(2).add(5).add(3)
      result = min_heap.map { |x| x * 2 }
      expect(result.sort).to eq([4, 6, 10])
    end
  end
end
