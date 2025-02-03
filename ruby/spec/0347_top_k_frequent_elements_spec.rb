# frozen_string_literal: true

require_relative '../lib/0347_top_k_frequent_elements'
require 'rb_heap'

RSpec.describe TopKFrequentElements do
  shared_examples 'a top k frequent element finder' do |method|
    subject { described_class.public_send(method, nums, k) }

    context 'when the array only contains a single number' do
      let(:nums) { [1] }
      let(:k) { 1 }
      it { is_expected.to match_array [1] }
    end

    context 'when the array has a few elements' do
      let(:nums) { [1, 1, 1, 2, 2, 3] }
      let(:k) { 2 }

      it { is_expected.to match_array [1, 2] }
    end
  end

  describe '.sort_solution' do
    it_behaves_like 'a top k frequent element finder', :sort_solution
  end

  describe '.max_by_solution' do
    it_behaves_like 'a top k frequent element finder', :max_by_solution
  end

  describe '.heap_solution' do
    it_behaves_like 'a top k frequent element finder', :heap_solution
  end

  describe '.bucket_solution' do
    it_behaves_like 'a top k frequent element finder', :bucket_solution
  end
end
