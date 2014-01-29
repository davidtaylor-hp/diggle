require 'spec_helper'

describe 'find the definition of a word'  do
  it "shows the correct root page" do
    visit root_path

    expect(page).to have_content("Diggle")
  end

  context 'when the word does not exist in the local database' do

    before do
      #  stub something here
    end

    it "calls the dictionary api and displays the definition of the word" do
      new_word = create(:word, text: "apple")
      new_definition = create(:definition, text: "a fruit")
      new_entry = create(:entry, word: new_word, definitions: [new_definition])

      fill_in 'entry', with: new_word.text
      click_on 'SEARCH'
      expect(page).to have_content(new_definition.text)
    end

    context 'when the word does exist in the local database' do
      let!(:another_word) { create(:word, text: "unknown_word") }
      let!(:another_definition) { create(:definition) }
      let!(:another_entry) { create(:entry) }

      it "calls the local database displays the definition of the word" do
        visit root_path
        save_and_open_page
        fill_in 'entry', with: another_word
        click_on 'SEARCH'
        expect(page).to have_content(another_definition)
      end
    end
  end
end