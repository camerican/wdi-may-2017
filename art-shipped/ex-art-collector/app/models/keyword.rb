class Keyword < ApplicationRecord
  @@categories = {
    nationality: 'Nationalitaay',
    style: 'Stuhyle',
    medium: 'Meeedium'
  }
  enum category: @@categories.keys
  # enum category: [:nationality, :style, :medium]

  # def category_name 
  #   ["Nationalitaay","Stuhyle","Meeeedium"][self.class.categories.keys.find_index category]
  # end
  # belongs_to :parent, class_name: 'Keyword', optional: true
  has_many :artwork_keywords
  has_many :artworks, through: :artwork_keywords
end
