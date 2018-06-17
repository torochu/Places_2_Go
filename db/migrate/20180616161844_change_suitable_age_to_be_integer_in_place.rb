class ChangeSuitableAgeToBeIntegerInPlace < ActiveRecord::Migration[5.1]
  def change
    change_column :places, :suitable_age, :integer
  end
end
