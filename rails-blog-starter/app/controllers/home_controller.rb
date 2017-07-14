class HomeController < ApplicationController
  def index
    @posts = Post.new_posts
  end
end
