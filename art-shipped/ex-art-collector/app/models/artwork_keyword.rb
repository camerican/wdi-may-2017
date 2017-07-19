class ArtworkKeyword < ApplicationRecord
  belongs_to :keyword
  belongs_to :artwork
end