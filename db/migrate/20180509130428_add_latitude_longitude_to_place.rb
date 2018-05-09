class AddLatitudeLongitudeToPlace < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :latitude, :string
    add_column :places, :longitude, :string
  end
end
