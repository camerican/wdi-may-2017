class User

  def self.all
    #command = `psql -d test -c "SELECT * FROM users"`
    results = `sqlite3 db/codewars.db "SELECT * FROM users;"`
    sql_results_parser results
  end

  def self.first
  end

  def self.last
  end
  # `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  # `first_name` VARCHAR(64),
  # `last_name` VARCHAR(64),
  # `slack_id` VARCHAR(128),
  # `created_at` DATETIME,
  # `updated_at` DATETIME
  def self.sql_results_parser(results)
    #some code to parse what gets returned from the SQL command
    keys = %w(id first_name last_name slack_id created_id update_at)
    results.split("\n").map do |data|
      data.split('|').each.with_index.reduce({}) do |hash,(item,index)|
        key = keys[index]
        hash[key.to_sym] = item
        hash
      end
    end
  end
  
end