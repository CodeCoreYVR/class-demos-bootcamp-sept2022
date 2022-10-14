#define method

# def one
#     1
# end

# def two
#     2
# end

# def three
#     3
# end

# puts one
# puts two
# puts three

#=====Meta programming to reduce redundancy=====>

numbers = {
    1 => "one",
    2 => "two",
    3 => "three"
    # ...etc
}

numbers.each do |number, number_name|
    define_method(number_name) do
        #when using teh define_method, the first argument
        #is the name of the method being defined
        #The body of the method is the block that is used
        #for the defined method
        p number
    end
end

# one #now the method is created by name, and you can call it
# two
# three

#another example
define_method("hello_world") do
    puts "Hello World"
end

# hello_world


#Eval

#The eval method takes a string as an argument
#and will attempt to evaluate as ruby code
#THIS METHOD IS VERY DANGEROUS AND SHOULD NOT BE USED AT WORK
#WHEREVER POSSIBLE

# p eval("1 + 2 + 3")
# p eval("two + three")


