class RemoveTypeOfCuisineFromRestaurant < ActiveRecord::Migration
  def change
    remove_column :restaurants, :type_of_cuisine, :string
  end
end
