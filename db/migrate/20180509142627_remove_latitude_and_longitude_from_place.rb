class RemoveLatitudeAndLongitudeFromPlace < ActiveRecord::Migration[5.1]
  def change
    remove_column :places, :latitude, :string
    remove_column :places, :longitude, :string
  end
end
