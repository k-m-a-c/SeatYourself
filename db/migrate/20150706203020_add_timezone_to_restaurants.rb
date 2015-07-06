class AddTimezoneToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :timezone, :string
  end
end
