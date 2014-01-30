require 'spec_helper'

describe EntriesController do

  describe '#new' do

    def make_request
      get :new
    end

    it 'returns successfully' do
      expect(make_request).to be_success
    end

    it 'renders the template' do
      expect(make_request).to render_template(:new)
    end

    it 'makes an entry' do
      make_request

      expect(assigns(:entry)).to be_a Entry
      expect(assigns(:entry)).to be_new_record
    end
  end

  describe '#create' do

    def make_request
      post :create, entry: {word: "apple"}
    end

    let(:json) do
      {
        word: "apple",
        definitions: [
        {text: "a yummy fruit"}
      ]
      }.to_json
    end

      context 'when the word exists in the database' do

      let!(:entry) { create(:entry, word: "apple") }
      let!(:definition) { create(:definition, entry: entry, text: "a yummy fruit") }

      it 'is successful' do
        expect(make_request).to be_success
      end

      it 'renders json' do
        make_request
        expect(response.body).to eq(json)
      end
    end

    context 'when the word does not exist in the db' do
      context 'when the word is real' do
        before do

          WordFinder.stub(:fetch) do |word|
            create(:entry, word: word).tap do |entry|
              create(:definition, entry: entry, text: "the word's definition")
            end
          end
        end

        it 'is successful' do
          WordFinder.should_receive(:fetch).with("the word's definition")
          expect(make_request).to be_success
        end

        it 'renders json' do
          WordFinder.should_receive(:fetch).with("the word's definition")
          make_request
          expect(response.body).to eq(json)
        end
      end

      context 'when the word is bogus' do
        before do
          WordFinder.stub(:fetch).and_return(nil)
        end

        it 'returns unsucessfully' do
          WordFinder.should_receive(:fetch).with("apple")
          expect(make_request).to be_not_found
        end
      end
    end
  end
end