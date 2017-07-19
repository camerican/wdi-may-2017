class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :name
      t.belongs_to :artist, foreign_key: true
      t.datetime :completed_at
      t.integer :status

      t.timestamps
    end
  end
end
