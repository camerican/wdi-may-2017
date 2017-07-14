class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  scope :new_posts, ->(num=10) do
    order(:created_at => :desc).limit(num)
  end
  # def self.new_posts(num=10)
  #   self.order(:created_at => :desc).limit(num)
  # end
end
