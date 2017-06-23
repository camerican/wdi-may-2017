# app.rb
require 'geolocater'
require 'rainbow'

puts Rainbow('Please enter an ').darkgreen + Rainbow('IP address').papayawhip

ip = gets.strip

result = Geolocater.geolocate_ip(ip)
puts 'Your address is in ' + Rainbow(result['city']).red + ', ' + Rainbow(result['region_name']).gainsboro