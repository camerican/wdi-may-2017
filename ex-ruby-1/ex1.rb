# ex1.rb

# 1) get a name, and output it
puts "Please enter your name:"
name = gets.strip

puts "Hi #{name}"

# 2) create an array of dates
$my_dates = ["New Year's Eve","Halloween","Thanksgiving","Valentine's Day"]
$my_dates_vals = ["December 31","October 31","November 18","February 14"]
# 3) create a hash of holidays and the dates they fall on
# $holidays_and_dates = {
#   :halloween => 'October 31',
#   :thanksgiving => 'November 18',
#   :"New Year's Eve" => 'December 31'
# }

$holidays_and_dates = {}
$my_dates.each_with_index do |date,index|
  $holidays_and_dates[date.to_sym] = $my_dates_vals[index]
end

# http://patorjk.com/software/taag/
#  ______                   _          
# |_   _ \                 (_)         
#   | |_) |  ,--.   .--.   __   .---.  
#   |  __'. `'_\ : ( (`\] [  | / /'`\] 
#  _| |__) |// | |, `'.'.  | | | \__.  
# |_______/ \'-;__/[\__) )[___]'.___.'                                                                                          
#  ______           _          
# |_   _ `.        / |_        
#   | | `. \ ,--. `| |-',--.   
#   | |  | |`'_\ : | | `'_\ :  
#  _| |_.' /// | |,| |,// | |, 
# |______.' \'-;__/\__/\'-;__/                     
#  _________                                
# |  _   _  |                               
# |_/ | | \_|_   __  _ .--.   .---.  .--.   
#     | |   [ \ [  ][ '/'`\ \/ /__\\( (`\]  
#    _| |_   \ '/ /  | \__/ || \__., `'.'.  
#   |_____|[\_:  /   | ;.__/  '.__.'[\__) ) 
#            \__.'   [__|   

# Strings
# -------
# Strings are character sequences.  When within single quotes
# they are the literal representation of those characters.
my_string = 'I am a string\n'
# The \n is literally a backslash n rather than a newline
my_string2 = "I am a string\n"
# The \n is now a newline character
# We also have the ability to do variable interpolation 
# within double quotes:
my_string3 = "#{my_string2.strip} and I like it"
# will evaluate to "I am a string and I like it"

# we also have the ability to encode strings within 
# heredoc syntax:
my_sting4 = <<-CHARACTERSEQUENCEOFYOURCHOICE
This is a string here that I'm typing.
#{my_string2}
Who smells like beef?
CHARACTERSEQUENCEOFYOURCHOICE

# Integer
# ---
# Integers are whole numbers.  In Ruby, integers
# will remain integers when there is a mathematical 
# operation performed on them
3/2
#>> 1

# Float
# ---
# Floats have a decimal value encoded
3.0/2
#>> 1.5

# Boolean
# ---
# Boolean values are true or false
5 > 3
#>> true

# nil
# ---
# nil values represent the absense of a value
# they are similar to null or undefined in JavaScript

# array
# ---
# Arrays hold collections of values
[1,2,3,"Red","Blue"]

# hash
# ---
# A hash holds key value pairs, like a JavaScript object
{ :my_key => 1, :another_key => 43 }
# we could alternatively use the similified syntax instead
# of the hash rockets:
{ my_key: 1, another_key: 43}

num = 3
if num > 4
  puts "Big number!"
elsif num > 3
  puts "You're okay"
else
  puts "So disappointing"
end







