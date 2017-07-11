class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :fname, limit: 128
      t.string :lname, limit: 128
      t.string :email
      t.string :password, limit: 32

      t.timestamps
    end
  end
end
