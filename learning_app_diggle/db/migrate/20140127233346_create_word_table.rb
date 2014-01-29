class CreateWordTable < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :text
      t.references :entry
    end
  end
end
