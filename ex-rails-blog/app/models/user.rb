class User < ApplicationRecord
  def full_name
    "#{fname} #{lname}".strip
  end
end
