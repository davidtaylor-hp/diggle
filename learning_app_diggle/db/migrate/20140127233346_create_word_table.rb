class CreateWordTable < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :text
    end
  end
end
