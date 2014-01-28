class Entry < ActiveRecord::Base

  attr_accessible :word, :definition

  has_one :word
  has_many :definition
end