class CreateKeywords < ActiveRecord::Migration[5.1]
  def change
    create_table :keywords do |t|
      t.string :name
      # t.belongs_to :parent, foreign_key: { to_table: :keywords }, optional: true
      t.integer :category
      t.timestamps
    end
  end
end
