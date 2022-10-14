#Variadic methods are methods that can take any number of arguments
#A method's arity refers to how many arguments it takes
#the * in ruby is called the splat
#it is similar to JS's ... (spread operator)
#it can also be used to spread array elements as arguments
#splat stores values of the arguments given in an array

def product(*nums)
    nums.reduce(1) do |total, num|
        #reduce takes an optional argument of 1 for the initial value
        #if not given, it will take the first element of the argument list
        #and make it the initial value
        total * num
    end
end

p product(1,2,3,4,5,6,7)
p product(2,2,3)
p product()







