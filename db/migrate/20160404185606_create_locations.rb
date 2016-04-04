class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :state, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
    add_index :locations, :name, unique: true
  end
end
