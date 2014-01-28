class CreateDefinitionTable < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.string :text
    end
  end
end
