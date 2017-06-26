require 'sinatra'

get '/' do
  @roster = %w(Julia Logan Nick Katy Dennis Neil Hans James Victor Steven Erin)
  erb :home
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
  @profile = @roster[params[:person].to_sym]
  erb :profile
end