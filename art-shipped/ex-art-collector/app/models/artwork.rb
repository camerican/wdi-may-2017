class Artwork < ApplicationRecord
  belongs_to :artist
  has_many :art_keywords
  has_many :keywords, through: :art_keywords
end
