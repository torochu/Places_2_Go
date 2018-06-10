class AddImagesToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :images, :json
  end
end
