class User < ApplicationRecord
  has_many :posts
  has_many :comments
  enum :status => [:pending,:active,:deleted]
  # enum status: [:pending,:active,:deleted]
  def full_name
    "#{fname} #{lname}".strip
  end
  #scope :active, -> {where(status: :active)}
end
