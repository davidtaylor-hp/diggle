class Word < ActiveRecord::Base
  attr_accessible :text

  belongs_to :entry
end