# frozen_string_literal: true

require_relative '../lib/0001_two_sum'

RSpec.describe 'two_sum' do
  context 'target is negative' do
    it 'returns [0, 1] or [1, 0]' do
      expect(two_sum([-5, -5, 10], -10)).to match_array([0, 1])
    end
  end

  context 'target is positive' do
    it 'returns [0, 1] or [1, 0]' do
      expect(two_sum([3, 3], 6)).to match_array([0, 1])
    end
  end
end
