require 'spec_helper'

describe 'looking up a word in the dictionary', js: true do

it "shows the correct landing page" do
  visit root_path
  expect(page).to have_content("Diggle")
end

context 'the word already exists in the database' do

  let!(:test_word) { create(:word, text: 'apple') }
  let!(:test_entry) { create(:entry, word: test_word.text) }
  let!(:test_definition) { create(:definition, entry: test_entry, text: 'a yummy fruit') }

  let(:json) do
    {
      word: test_word.text,
      definitions: [
      {text: test_definition.text}
    ]
    }.to_json
  end

  it "displays the definition to the user" do

    visit root_path

    fill_in 'search', with: entry.word
    click_on "SEARCH"

    within '.definitions' do
      expect(page).to have_content test_definition.text
    end
  end
end

context 'the word does not exist in our database' do
  let(:unknown_word) { create(:word, text:'orange') }
  let(:definition_1) { create(:definition, text:'a colour') }
  let(:definition_2) { create(:definition, text:'a round fruit') }
  let(:test_definitions) { [definition_1.text, definition_2.text] }

  let(:expected_url) { "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{unknown_word}?key=test-api-key" }

  before do
    #stub_request(:get, expected_url).to_return(status: 200, body: load_fixture("multiple_entries_and_definitions", "xml", word: unknown_word.text, definitions: test_definitions))
  end

  it 'calls the api and shows the definitions' do
    visit root_path

    fill_in 'search', with: unknown_word.text
    click_on "SEARCH"

    within '.definitions' do
      expect(page).to have_content first_definition
      expect(page).to have_content second_definition
    end
  end
end
end