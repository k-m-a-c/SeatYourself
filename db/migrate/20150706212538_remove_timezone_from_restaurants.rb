class RemoveTimezoneFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :timezone
  end
end
