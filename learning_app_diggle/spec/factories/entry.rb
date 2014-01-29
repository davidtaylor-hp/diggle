FactoryGirl.define do
  factory :entry do
    word { create(:word, text: "apple") }
    definitions { [ create(:definition, text: "a fruit") ] }
  end
end