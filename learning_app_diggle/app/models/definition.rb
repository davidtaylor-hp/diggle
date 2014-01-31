class Definition < ActiveRecord::Base
  attr_accessible :text

  belongs_to :entry

  def presenter
    DefinitionPresenter.new(self)
  end
end