class Artwork < ApplicationRecord
  belongs_to :artist
  has_many :artwork_keywords
  has_many :keywords, through: :artwork_keywords
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", superjumbo: "1000x1000>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
