require_relative '../lib/0217_contains_duplicate'

RSpec.describe ContainsDuplicate do
  shared_examples 'a duplicate checker' do |method|
    subject { described_class.public_send(method, array) }

    context 'when the array contains duplicates' do
      let(:array) { [1, 2, 3, 1] }
      it { is_expected.to be true }
    end

    context 'when the array does not contain duplicates' do
      let(:array) { [1, 2, 3, 4] }
      it { is_expected.to be false }
    end

    context 'when the array is empty' do
      let(:array) { [] }
      it { is_expected.to be false }
    end

    context 'when the array has a single element' do
      let(:array) { [42] }
      it { is_expected.to be false }
    end

    context 'when the array has multiple duplicates' do
      let(:array) { [1, 1, 2, 2, 3, 3] }
      it { is_expected.to be true }
    end
  end

  # Test solution_one
  describe '.solution_one' do
    it_behaves_like 'a duplicate checker', :solution_one
  end

  # Test solution_two
  describe '.solution_two' do
    it_behaves_like 'a duplicate checker', :solution_two
  end
end
