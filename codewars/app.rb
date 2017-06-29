require 'sinatra'
# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'
include SendGrid
require 'sinatra/activerecord'
set :database, {adapter: "sqlite3", database: "db/codewars.db"}
require './models'

get '/' do
  #@roster = %w(Julia Logan Nick Katy Dennis Neil Hans James Victor Steven Erin)
  #@roster = User.all.map{|u| u.first_name }
  @roster = User.all
  erb :home
end

get '/contact' do
  erb :contact
end

post '/contact' do
  # get from address from our form
  # to do: verify the email is valid
  from = Email.new(email: params[:email])
  to = Email.new(email: 'cam@nycda.com')
  # get subject from our form
  subject = params[:title]
  # get content from our form
  content = Content.new(type: 'text/plain', value: params[:body])
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers
  redirect '/contact'
end


get '/profile/:person' do
  @roster = {
    Julia: 'Loves Sinatra',
    Logan: 'Loves Sinatra',
    Nick: 'Loves Sinatra',
    Katy: 'Loves Sinatra',
    Dennis: 'Hates Sinatra',
    Neil: 'Loves Sinatra',
    Hans: 'Loves Sinatra',
    James: 'Loves Sinatra',
    Victor: 'Loves Sinatra',
    Steven: 'Hates Ruby in General',
    Erin: 'Loves Sinatra'}
  @user = User.where(first_name: params[:person])
  @profile = @roster[params[:person].to_sym]
  erb :profile
end