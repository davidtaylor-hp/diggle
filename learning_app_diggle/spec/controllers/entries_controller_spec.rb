require 'spec_helper'

describe EntriesController do
  describe '#new' do
    def make_request
      get :new
    end

    it "returns successfully" do
      expect(make_request).to be_success
    end

    it "renders template" do
      expect(make_request).to render_template(:new)
    end

    it "assigns the entry" do
      make_request
      expect(assigns(:entry)).to be_an Entry
      expect(assigns(:entry)).to be_a_new_record
    end
  end

  describe '#create' do
    let!(:new_word) { create(:word, text: "apple") }
    let!(:new_definition) { create(:definition, text: "a fruit") }
    let!(:new_entry) { create(:entry, word: new_word, definitions: [new_definition]) }

      let(:json_definitions) do
        {
          word: new_word,
          definition: new_definition
        }.to_json
      end

    def make_request
      post :create, entry: { word: new_word }
    end

    it "returns successfully" do
      expect(make_request).to be_success
    end

    it "returns json of the definitions" do
      make_request
      expect(request.body).to eq(json_definitions)
    end
  end
end
