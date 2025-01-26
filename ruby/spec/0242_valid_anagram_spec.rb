# frozen_string_literal: true

require_relative '../lib/0242_valid_anagram'

RSpec.describe 'valid_anagram' do
  context 'when the strings are anagrams' do
    it 'returns true' do
      expect(is_anagram('cat', 'tac')).to be true
    end
  end

  context 'when the strings are not anagrams' do
    it 'returns false' do
      expect(is_anagram('cat', 'zzz')).to be false
    end
  end

  context 'when the strings are different lengths' do
    it 'returns false' do
      expect(is_anagram('cat', 'fish')).to be false
    end
  end
end
