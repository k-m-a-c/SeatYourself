class AddNameToCuisine < ActiveRecord::Migration
  def change
    add_column :cuisines, :name, :string
  end
end
