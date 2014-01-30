FactoryGirl.define do
  factory :entry do
    word { create(:word) }
    definitions { create(:definition) }
  end
end