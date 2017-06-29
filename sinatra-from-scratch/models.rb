# models.rb
class User < ActiveRecord::Base
  has_many :posts
  def full_name
    "#{first_name} #{last_name}".strip
  end
end
class Post < ActiveRecord::Base
  belongs_to :user
end