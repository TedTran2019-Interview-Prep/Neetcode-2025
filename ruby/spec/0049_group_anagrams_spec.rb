# frozen_string_literal: true

require_relative '../lib/0049_group_anagrams'

RSpec.describe GroupAnagrams do
  shared_examples 'an anagram grouper' do |method|
    subject { described_class.public_send(method, strs) }

    context 'when the array contains no strings' do
      let(:strs) { [] }
      it { is_expected.to eq [] }
    end

    context 'when the array contains a single string' do
      let(:strs) { ['a'] }
      it { is_expected.to eq [['a']] }
    end

    context 'when the array contains a single empty string' do
      let(:strs) { [''] }
      it { is_expected.to eq [['']] }
    end

    context 'when the array contains no anagrams' do
      let(:strs) { %w[bat nat ate] }
      it { is_expected.to contain_exactly(['bat'], ['nat'], ['ate']) }
    end

    context 'when the array contains multiple anagrams' do
      let(:strs) { %w[eat tea tan ate nat bat] }
      it do
        sorted_subject = subject.map(&:sort).sort_by(&:size)
        expected = [
          ['bat'],
          %w[nat tan],
          %w[ate eat tea]
        ]
        expect(sorted_subject).to eq(expected)
      end
    end
  end

  # Test solution_one
  describe '.solution_one' do
    it_behaves_like 'an anagram grouper', :solution_one
  end

  # Test solution_two
  describe '.solution_two' do
    it_behaves_like 'an anagram grouper', :solution_two
  end
end
