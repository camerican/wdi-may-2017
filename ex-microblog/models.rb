class User < ActiveRecord::Base
  enum :status => [:pending,:active,:deleted]
#  enum status: [:pending,:active:,:deleted]
  has_many :posts
  def full_name
    "#{fname} #{lname}".strip
  end
  def self.all
    super.where.not( status: :deleted )
  end
  def posts
    super.where(is_published: true)
  end
end
class Post < ActiveRecord::Base
  belongs_to :user
  # we want the most recent 10 posts
  def self.recent( num = 10 )
    self.where(is_published: true).order( created_at: :desc ).limit( num )
  end
end

# User.first.posts
# Post.first.user