class User < ApplicationRecord
  has_many :posts
  has_many :comments
  def full_name
    "#{fname} #{lname}".strip
  end
end
