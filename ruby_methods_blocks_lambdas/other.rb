#ternary operator
a = true
#a = false

p a ? "a is true" :  "a is not true"

# Or equals ||=
a ||= 5

#x = true   # x's value will remain true
x = false # x's value willl be 5

x ||=5

# p x

a ||= b
# Like saying a || a = b, a is only set if a is logically false (i.e. if it's nil or false) 
# because || is 'short circuiting'. That is, if the left hand side of the || comparison is true, 
# there's no need to check the right hand side.
a = nil
b = 20
a ||= b
a       # => 20



#==========CASE===========>
# In JS we had switch and case statements, but in ruby it is slightly different syntax and use 
# the word “when”


puts "Hello there! Please enter a language"

language = gets.chomp

    case language
    when "English"
        puts "Hello"
    when "Spanish"
        puts "Hola"
    when "French"
        puts "Bonjour"
    when "Russian"
        puts "Privet"
    when "Arabic"
        puts "Salam"
    when "Korean"
        puts "안녕하세요"
    when "Vietnamese"
        puts "Chào"
    when "Hindi"
        puts "Namaste"
    when "Afrikaans"
        puts "Goeie Dag"
    else
        puts "What was that?"
    end


