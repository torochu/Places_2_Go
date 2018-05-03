class AddCityDistrictAddressToPlace < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :city, :string
    add_column :places, :district, :string
    add_column :places, :address, :string
  end
end
