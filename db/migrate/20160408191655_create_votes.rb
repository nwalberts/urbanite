class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :review
      t.integer :value, null: false

      t.timestamps null: false
    end
  end
end
