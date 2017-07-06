require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require 'sinatra/flash'
set :database, {adapter: 'sqlite3', database: 'db/microblog.db'}
enable :sessions
require './models'

# /  home.erb
# /profile   profile.erb
# /user      user.erb # show all users posts

before do
  @current_user = session[:user_id] ? User.find(session[:user_id]) : nil
  # if session[:user_id]
  #   @current_user = User.find(session[:user_id])
  # else
  #   @current_user = nil
  # end
  #redirect "/#{@post.user.username}"
end

before ['/write','/profile'] do
  redirect '/' unless @current_user 
end

get '/' do
  @users = User.all
 # @posts = Post.order( created_at: :desc).limit(10)
  @posts = Post.recent
  erb :home
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    flash[:message] = "Welcome to our site, #{@user.fname}"
    redirect '/profile'
  else  
    flash[:message] = "We don't recognize that information.  Sorry!"
    redirect '/'
  end
end

# allow the author to submit a new post
get '/write' do
  erb :author
end

# handle a new post
post '/write' do
  @post = Post.new( title: params[:title],
            body: params[:body],
            user_id: @current_user.id )
  if @post.save
    flash[:message] = "Got your post!  Nice work!"
    redirect '/profile'
  else
    flash[:message] = "Unable to save your post :'("
    redirect '/write'
  end
end

# show profile data
get '/profile' do
  erb :profile
end

# change profile data
post '/profile' do
  # if it's actually still them
  if @current_user.password == params[:password]
    @current_user.update(
      fname: params[:fname],
      lname: params[:lname]
    )
    flash[:message] = "Thanks for the update, #{params[:fname]}"
  # you're an imposter!!
  else
    flash[:message] = "Looks like you gave us an incorrect password.  Hack blocked!!"
  end
  redirect '/profile'
end

get '/user/:id' do 
  @user = User.find( params[:id] )
  erb :user
end

get '/post/:id/delete' do
  @post = Post.find( params[:id] )
  if @post.user_id != @current_user.id
    flash[:message] = "You dirty dog, that's not your post!"
  elsif @post.destroy
    flash[:message] = "Deleted post"
  else
    flash[:message] = "Your post could not be deleted"
  end
  redirect '/'
end

get '/post/:id' do
  @post = Post.find( params[:id] )
  erb :post
end

