class User < ActiveRecord::Base
  has_many :posts
  def full_name
    "#{fname} #{lname}".strip
  end
end
class Post < ActiveRecord::Base
  belongs_to :user
end

# User.first.posts
# Post.first.user