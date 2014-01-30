require 'spec_helper'

describe Entry do
  context 'associations' do
    it { should have_many(:definitions) }
    it { should have_one(:word) }
  end

  context 'validations' do
    it { should validate_uniqueness_of(:word) }
  end

  describe '#presenter' do
    entry = create(:entry)
      it { entry.presenter.should == EntryPresenter.new(entry) }
  end
end