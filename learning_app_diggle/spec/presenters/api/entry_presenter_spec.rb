require 'spec_helper'

describe EntryPresenter do
  describe '#as_json' do
    let!(:entry) { create(:entry, word : 'apple') }
    let!(:second_definition) { create(:definition, entry: entry, text: 'second_definition') }
    let!(:first_definition) { create(:definition, entry: entry, text: 'first definition') }

    subject{ EntryPresenter.new(entry) }

    it 'returns the definitions in alphabetical order' do
      expect(subject.as_json).to eq({
        word: 'test',
        definitions: [{ text: 'first definition' },
                      { text: 'second_definition'}]
      })
    end
  end
end