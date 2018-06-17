class ChangeParkingToBeStringInPlaces < ActiveRecord::Migration[5.1]
  def change
    change_column :places, :parking, :integer, default: 0
  end
end
