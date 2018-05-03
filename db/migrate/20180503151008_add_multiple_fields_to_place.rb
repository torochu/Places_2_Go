class AddMultipleFieldsToPlace < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :recommendation, :integer
    add_column :places, :food_ranking, :integer
    add_column :places, :suitable_age, :string
    add_column :places, :average_cost, :string
    add_column :places, :train_distance, :string
    add_column :places, :station_nearby, :string
    add_column :places, :parking, :boolean
    add_column :places, :booking, :boolean
    add_column :places, :comment, :text
    add_column :places, :user_name, :string
    add_column :places, :limitation, :text
    add_column :places, :facility, :text
    add_column :places, :business_hour, :text
    add_column :places, :minimum_order, :string
    add_column :places, :phone, :string
    add_column :places, :url, :string
    add_column :places, :draft, :boolean, default: true
  end
end
