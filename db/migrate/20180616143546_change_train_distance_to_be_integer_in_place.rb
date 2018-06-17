class ChangeTrainDistanceToBeIntegerInPlace < ActiveRecord::Migration[5.1]
  def change
    change_column :places, :train_distance, :integer
  end
end
