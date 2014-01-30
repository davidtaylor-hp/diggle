require 'spec_helper'

describe WordFinder do
  describe '.find' do
    let(:word) { 'apple' }

    before do
      #stub something here
    end

    context 'definitions are returned' do
      let(:word_hash) do
        {
          word: 'apple',
          definitions: ['a yummy fruit', 'a round fruit']
        }
      end

      it 'creates the entry and definitions' do
        WebServices::Dictionary.should_receive(:find_definition).with(word)

        expect { described_class.fetch(word) }.to change { Definition.count }.from(0).to(2)

        entry = Entry.last
        expect(entry.word).to eq('apple')
        expect(entry.definitions.map(&:text)).to match_array(['a yummy fruit', 'a round fruit'])
      end
    end

    context "definitions don't exist" do
      let(:test_word) { {word: word, definitions: [] }}

      it "doesn't return any definitions" do
        WebServices::Dictionary.should_receive(:find_definition).with(word)
        expect(described_class.fetch(word)).to be_nil
        expect { described_class.fetch(word) }.to_not change { Definition.count }
      end
    end
  end
end