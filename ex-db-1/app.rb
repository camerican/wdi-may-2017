require 'sinatra'
require 'sinatra/activerecord'
set :database, {adapter: "sqlite3", database: "post.db"}
require './models'

get '/' do
  @users = User.all
  erb :home
end

# list all user posts
get '/users/:id' do 
  @user = User.find params[:id]
  @posts = Post.where user_id: params[:id]
  erb :posts
end