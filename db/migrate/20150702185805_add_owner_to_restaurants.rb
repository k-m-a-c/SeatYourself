class AddOwnerToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :owner_id, :integer, index: true
  end
end
