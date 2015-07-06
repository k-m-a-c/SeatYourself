class CreateRestaurantsCuisinesAssociation < ActiveRecord::Migration
  def change
    create_table :restaurants_cuisines, id: false do |t|
      t.belongs_to :restaurant, index: true
      t.belongs_to :cuisine, index: true
    end
  end
end
