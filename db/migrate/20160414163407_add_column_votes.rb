class AddColumnVotes < ActiveRecord::Migration
  def change
    add_column :votes, :value, :integer, default: 0, null: false
  end
end
