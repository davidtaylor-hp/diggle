class CreateEntryTable < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :word
      t.string :definitions
    end
  end
end
