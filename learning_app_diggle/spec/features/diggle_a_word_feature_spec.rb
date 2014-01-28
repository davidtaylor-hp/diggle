require 'spec_helper'

describe 'find the definition of a word' do
  it "shows the correct root page" do
    visit root_path

    expect(page).to have_content("Diggle")
  end

  context 'when the word does not exist in the local database' do
    let!(:new_word) { create(:word, text: "apple") }
    let!(:new_definition) { create(:definition, text: "a fruit") }
    let!(:new_entry) { create(:entry, word: new_word, definition: new_definition) }

    before do
      #  stub something here
    end

    it "calls the dictionary api and displays the definition of the word" do
      fill_in 'entry', with: new_word
      click_on 'SEARCH'
      expect(page).to have_content(new_definition)
    end

    context 'when the word does exist in the local database' do
      let!(:another_word) { create(:word, text: "unknown_word") }
      let!(:another_definition) { create(:definition) }
      let!(:another_entry) { create(:entry, word: another_word, definition: another_definition) }

      it "calls the local database displays the definition of the word" do
        fill_in 'entry', with: another_word
        click_on 'SEARCH'
        expect(page).to have_content(another_definition)
      end
    end
  end
end