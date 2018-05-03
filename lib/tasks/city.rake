
namespace :city do
  desc "Create City Data"

  task create: :environment do |t|
    City.delete_all
    puts "建立 Cities..."
#    City.create(:name => "基隆市")     # 1
#    City.create(:name => "臺北市")     # 2
#    City.create(:name => "新北市")     # 3
#    City.create(:name => "桃園市")     #4
#    City.create(:name => "新竹市")     #5
#    City.create(:name => "新竹縣")     #6
#    City.create(:name => "苗栗縣")     #7
#    City.create(:name => "臺中市")     #8
#    City.create(:name => "彰化縣")     #9
#    City.create(:name => "南投縣")     #10
#    City.create(:name => "雲林縣")     #11
#    City.create(:name => "嘉義市")     #12
#    City.create(:name => "屏東縣")     #13
#    City.create(:name => "臺東縣")     #14
#    City.create(:name => "花蓮縣")     #15
#    City.create(:name => "宜蘭縣")     #16
#    City.create(:name => "澎湖縣")     #17
#    City.create(:name => "金門縣")     #18
#    City.create(:name => "連江縣")     #19
    file_path = "./public/places2go.csv"
    hsh = {}
    CSV.foreach(file_path, headers: true, row_sep: :auto) do |row|
      hsh[row['city']] = 1
    end

    hsh.each do |k,v|
      #puts hsh.as_json
      name = k.gsub("\n", '')
      City.create(name: name)
    end
    
  end
end
