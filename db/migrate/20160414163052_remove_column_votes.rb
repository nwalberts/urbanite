class RemoveColumnVotes < ActiveRecord::Migration
  def up
    remove_column :votes, :value
  end

  def down
    add_column :votes, :value, :integer
  end
end
