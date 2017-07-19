class Keyword < ApplicationRecord
  enum category: [:nationality, :style, :medium]
  # belongs_to :parent, class_name: 'Keyword', optional: true
  has_many :art_keywords
  has_many :artworks, through: :art_keywords
end
