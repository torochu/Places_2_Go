class ChangeMinimumOrderToBeIntegerInPlace < ActiveRecord::Migration[5.1]
  def change
    change_column :places, :minimum_order, :integer
  end
end
