class AddImageToResturants < ActiveRecord::Migration
  def change
    add_column :resturants, :image, :string
  end
end
