class AddUserLocations < ActiveRecord::Migration
  def change
    add_reference(:locations, :user)
  end
end
