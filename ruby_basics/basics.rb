# https://ruby-doc.org

# Comment
# Ruby commentds use # to start a single line comment

=begin
    I'm a multi
    line comment
    this is the syntax      
=end

#It is convention to have two space indentations within a code block.  However, a tab is also acceptable. Just stay consistent.
#You can also set your code editor to adjust the spacing by default when using the tab key

#CONSOLE PRINTING

#print -> all printed strings will be printed in the same line
# print("Hello World") 
# print "Bye World"   #will print in the same line

#puts -> prints in a separate line
# puts("Hi there")
# puts "Bye there" #will print on a new line

#p -> the p method prints a value how ruby sees it, and will return everything to give you more detail about
#the value you are printing.  This could be useful, but not always wanted - i.e. it could print \n to indicate a new line
# p("This is another print")
# p "This is another print" #will print on a new line

#methods do not require parentheses

#VARIABLES
#We always use snake_case
# first_name = "Sam"
# p first_name

# a = 1
# b = a + 5
# c = a + b

# p c

# a1 = 11 -> acceptable

# 2a = 12 ->  not acceptable

#VARIABLES WITH ALL CAPS ARE CONSIDERED CONSTANTS
# MAX_PASSWORD_ATTTEMPTS = 6

# MAX_PASSWORD_ATTTEMPTS = 8  -> you can still technically change the value, but you should not
# p MAX_PASSWORD_ATTTEMPTS

# Should_not = "Not a desirable varaible name" -> do not use capitalized names for variables

#gets method
#gets allows you to prompt a user to input

# puts "Please enter your name"
# user_input = gets
# puts "your username is #{user_input}"

# puts "input a number?"
# number = gets
# puts number.to_i

# puts "Please enter your name"
# user_name = gets.chomp #chomp will remove the return line characters \n at the end of the input
# p user_name

#First name and Last name prompts
# puts "Please enter your first name"
# first_name = gets.chomp
# puts "Please enter your last name"
# last_name = gets.chomp
# print first_name + " " + last_name + "\n"

#STRINGS

"I'm a string"
'I\'m also a string'
# "I'm a string with string interpolation #{my_variable}"

name = "Steph"
puts "Hello #{name}"
puts name
name = "John"
puts name
