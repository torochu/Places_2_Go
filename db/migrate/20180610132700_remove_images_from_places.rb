class RemoveImagesFromPlaces < ActiveRecord::Migration[5.1]
  def change
    remove_column :places, :images, :json
  end
end
