class User < ActiveRecord::Base
  def full_name
    if !first_name.nil? && !last_name.nil?
        first_name + " " + last_name
    elsif !first_name.nil?
        first_name
    elsif !last_name.nil?
        last_name
    end
  end
end