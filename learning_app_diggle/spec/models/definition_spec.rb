require 'spec_helper'

describe Definition do
  context 'associations' do
    it { should belong_to(:entry) }
  end

  describe '#presenter' do
    definition = create(:definition)
    it { definition.presenter.should == DefinitionPresenter.new(definition) }
  end
end
