require 'csv'

namespace :data do
  desc "Create one admin user & one normal user"

  task import_data: :environment do |t|
    Place.delete_all
    puts "Importing places...."

    file_path = "./public/places2go_v2.csv"

    CSV.foreach(file_path, headers: true) do |row|
        Place.create!(
          #:city => row['city'],
          #:city_id => City.find_by_name(row['city'].gsub("\n", '')).id,
          :user_id => 1,
          :name => row['place_name'],
          :category_id => Category.find_by_name(row['category'].gsub("\n", '')).id,
          :recommendation => row['recommendation'],
          :food_ranking => row['food_ranking'],
          :suitable_age => row['suitable_age'],
          :average_cost => row['average_cost'],
          :train_distance => row['train_distance'],
          :station_nearby => row['station_nearby'],
          :parking => row['parking'],
          :booking => row['booking'],
          :comment => row['comment'],
          :user_name => row['user_name'],
          :limitation => row['limitation'],
          :facility => row['facility'],
          :business_hour => row['business_hour'],
          :minimum_order => row['minimum_order'],
          :phone => row['phone'],
          :address => row['address'],
          :url => row['url']
        )
      end
  end
end
