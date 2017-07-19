class ArtworkKeywordJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :artwork_keywords, id: false do |t|
      t.belongs_to :artwork
      t.belongs_to :keyword
      t.timestamps
    end
  end
end
