class Entry < ActiveRecord::Base
  has_many :definitions
  has_one :word

  def presenter
    EntryPresenter.new(self)
  end
end