class AddTimezoneToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :timezone, :string
  end
end
