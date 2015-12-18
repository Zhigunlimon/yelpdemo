class AddResturantIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :resturant_id, :integer
  end
end
