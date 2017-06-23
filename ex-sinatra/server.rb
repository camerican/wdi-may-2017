# server.rb
require 'sinatra'

get '/' do
  <<-HTMLOUT
<nav>
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/portfolio">Portfolio</a></li>
    <li><a href="/about">About</a></li>
  </ul>
</nav>
Howdy, Partner.  Like my <a href=\"/portfolio\">portfolio</a>?
  HTMLOUT
end

get '/portfolio' do
  fav_number = rand(6)+1
  <<-NICKISGREAT
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Portfolio</title>
</head>
<body>
<nav>
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/portfolio">Portfolio</a></li>
    <li><a href="/about">About</a></li>
  </ul>
</nav>
<h1>Portfolio</h1>
<p>This is the greatest portfolio ever!</p>
<p>Btw, my favorite number for today is #{fav_number}</p>
<h4>Under construction</h4>
</body>
</html>
  NICKISGREAT
end

get '/about' do
  <<-HTMLOUT
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Why I am Great</title>
</head>
<body>
<h1>About me</h1>
<nav>
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/portfolio">Portfolio</a></li>
    <li><a href="/about">About</a></li>
  </ul>
</nav>
<p>My site is the reflection of who I am.  It is all about me.   I enjoy writing code.  Code makes me happy.  I could tell you more.</p>
</body>
</html>
  HTMLOUT
end


