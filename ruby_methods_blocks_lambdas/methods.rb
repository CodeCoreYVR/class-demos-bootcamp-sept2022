#Methods

#A method is created with the "def" keyword to define a method
#It takes in any arguments you want, separated by comma, brackets optional

def method_name( arg1, arg2)
    #here is where you code goes
    #it will implicitly return the value
    #of the last expression
end

# def multiply(a,b)
#     p a*b
# end

#you can call a method by its name and arguments
#brackets also optional

# multiply(2,4)
# multiply 3, 5

#========return====>

def my_method(a,b)
    return a * b #you use the return keyword if you want to exit early, prior to the last expression that will be ignored
    a + b
end

# p my_method(3,2)

#======default argument values=====>
def multiply(a=2, b)
    a * b
end

p multiply(4)  #this will return 8 because ruby will give the first argument the value of 2 and give the second argument the value of 4

#ruby will raise an error if the incorrect number of arguments are given to a method that is not a variadic method





