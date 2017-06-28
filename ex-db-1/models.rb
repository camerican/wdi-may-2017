# User model
class User < ActiveRecord::Base
  has_many :posts
end
# Post model
class Post < ActiveRecord::Base
  belongs_to :user
end