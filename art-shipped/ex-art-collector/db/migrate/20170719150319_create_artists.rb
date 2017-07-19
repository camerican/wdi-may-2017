class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.datetime :dob
      t.datetime :dod

      t.timestamps
    end
  end
end
