class ChangeAverageCostToBeIntegerInPlace < ActiveRecord::Migration[5.1]
  def change
    change_column :places, :average_cost, :integer
  end
end
