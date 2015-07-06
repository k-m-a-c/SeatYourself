class AddTypeOfCuisineToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :type_of_cuisine, :string
  end
end
