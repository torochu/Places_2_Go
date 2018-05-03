# rake csv:reset
# rake csv:import

namespace :csv do
  desc "import data from csv data"
  task :reset => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate"]

  task :import => [
                    # Create Users
                    #"create_user:create_admin_user",
                    # 娛樂美食類型
                    "category:create",
                    # 地區
                    "city:create",
                    # 基本csv資料
                    #"data:import_data"
                   ]
end
