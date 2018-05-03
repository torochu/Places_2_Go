require 'csv'

namespace :category do
  desc "Create category data"

  task create: :environment do |t|
    Category.delete_all
    puts "建立 Categories..."
      file_path = "./public/places2go.csv"
      hsh = {}
      CSV.foreach(file_path, headers: true, row_sep: :auto) do |row|
        hsh[row['category']] = 1
      end

      hsh.each do |k,v|
        #puts hsh.as_json
        name = k.gsub("\n", '')
        Category.create(name: name)
      end
  end
end
