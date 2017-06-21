# ex2.rb

#1 ) write a function that adds 5 to the argument givne

def add_five num
  num + 5
end

#2) write a function that returns the number given * 15
def multiply_fifteen num
  num * 15
end

#3) peform math operation on four arguments
def distance x1, y1, x2, y2
  ((x1-x2)**2+(y1-y2)**2)**0.5
end

#4) print an argument 4 times
def say_four_times str
  4.times do 
    puts str
  end
  str * 4
end

#5 ) return an uppercase version of string provided
def shout str
  str.to_s.upcase
end




