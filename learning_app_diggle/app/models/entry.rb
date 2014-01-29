class Entry < ActiveRecord::Base
  attr_accessible :word, [:definitions]

  has_one :word
  has_many :definitions
end