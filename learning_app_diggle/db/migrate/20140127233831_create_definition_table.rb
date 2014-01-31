class CreateDefinitionTable < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.string :text
      t.references :entry
    end
  end
end

