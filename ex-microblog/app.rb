require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3' # ??
require 'sinatra/flash'

configure :development, :test do
  set :database, {adapter: 'sqlite3', database: 'db/microblog.db'}
end

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

before ['/write','/profile','/post/:id/delete'] do
  redirect '/' unless @current_user 
end

get '/' do
  @users = User.where.not(status: :deleted)
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

get '/user/:id/delete' do
  #to do: only admins can do this...
  @user = User.find(params[:id])
  if !@user
    flash[:message] = "Couldn't locate that user, sorry"
  elsif @user.update( status: :deleted )
    flash[:message] = "User deleted, nice work"
  else
    flash[:message] = "There was a problem on our back end.  Sorrrry"
  end
  redirect '/'
end

get '/post/:id/delete' do
  @post = Post.find( params[:id] )
  if @post.user_id != @current_user.id
    flash[:message] = "You dirty dog, that's not your post!"
  elsif @post.update(is_published: false)
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

get '/profile' do
  # if !@current_user
  unless @current_user 
    flash[:message] = "Sign in to access your profile"
    redirect '/login'
  end
  flash[:message] = "Welcome, #{@current_user.first_name}"
  erb :profile
end



