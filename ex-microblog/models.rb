class User < ActiveRecord::Base
  has_many :posts
  def full_name
    "#{fname} #{lname}".strip
  end
end
class Post < ActiveRecord::Base
  belongs_to :user
  # we want the most recent 10 posts
  def self.recent( num = 10 )
    self.order( created_at: :desc ).limit( num )
  end
end

# User.first.posts
# Post.first.user