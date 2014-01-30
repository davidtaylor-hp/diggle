require 'spec_helper'

describe DefinitionPresenter do
  let(:definition) { create(:definition) }

  describe '#as_json' do
    it 'returns the correctly formatted definition' do
      expect(DefinitionPresenter.new(definition).as_json).should == definition.text
    end
  end
end