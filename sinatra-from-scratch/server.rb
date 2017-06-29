# server.rb
require 'sinatra'
require 'sinatra/activerecord'
# configure our database
set :database, {adapter: "sqlite3", database: "db/hack.db"}
# models.rb requires a database connection, so let's include that only after the database is configured
require './models'

get '/' do
  @users = User.all
  erb :home
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :profile
end