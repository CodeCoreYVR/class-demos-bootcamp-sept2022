#===RUBY CLASSES=====>
#we define a class in Ruby usong the "class" keyword
#class names are constants and therefore start with a capital letter
#The convention is CamelCase for naming classes, like CookieMonster
#The convention for file names are snake_case: cookie_mo0nster.rb
#Best practise to keep one class in one file

#=====Global variable====>
$greeting = "Hello" #Creating a global variable that is accessible throughout your program.  But usually not good practise to use them
# global variables are attributes that can be accessed by all objects, and subclasses
# A global variable has a name beginning with $. It can be referred to from anywhere in a program. Before initialization, a global variable has the special value nil.
# Global variables should be used sparingly. 
# They are dangerous because they can be written to from anywhere. 
# Overuse of globals can make isolating bugs difficult; 
# it also tends to indicate that the design of a program has not been carefully thought out. 
# Whenever you do find it necessary to use a global variable, be sure to give it a descriptive name that is unlikely to be inadvertently used for something else later

class Cookie
    #Initialize method - similar to constructor function in JS
    def initialize(sugar=1, flour=2)
        p "you are in the initialize method"

        #instance variables
        @sugar = sugar 
        @flour = flour
        # instance variables are denoted with @ in front
        # instance variables are variables instance methods of your class have access to. 
        # They're unique to an instance

        #class variable
        @@colour = "Brown" #class variables can be accessed and changed by all subclasses as well
    end

    #getter method
    # def sugar
    #     @sugar
    # end
    #below is the same as above
    # attr_reader :sugar

    # def flour
    #     @flour
    # end
    # attr_reader :flour

    #setter method
    # def sugar=(new_sugar)
    #     @sugar = new_sugar
    # end
    # attr_writer :sugar

    #below accounts for both the setter and getter methods:
    attr_accessor :sugar

    #access both getter and setter methods for flour:
    attr_accessor :flour

    #Class method 
    def self.info
        p "Cookies are essential to a balanced diet!"
    end

    def eat
        p "Nom nom nom...."
        # hello()
    end

    def bake_n_eat
        bake()
        eat()
    end

    def details
        p "Cookie details: sugar - #{@sugar}, flour - #{@flour}, colour - #{@@colour}"
    end

    private

    def bake
        p "Baking the cookie"
    end

    # def hello
    #     p "#{$greeting}"
    # end
end

# c = Cookie.new

# c.bake 
# the method bake will not work for the instance of a cookie if it is a private method
# a private method is only accessible in the scope of the Class itself. i.e. it will only work
# now if it is called inside another public method, otherwise it will raise a "NoMethod" error

# c.eat #this is a public method and is therefore available to any instance of the cookie class

# c.bake_n_eat

# Cookie.info #a class method can only be invoked on the class itself
# c.info #raise an exception/ throw an error

# cookie2 = Cookie.new(4,8) #if the initialize method requires arguments, 
# arguments should be supplied when initializing a new instance of a class. 
# Default values can be set in case arguments are not supplied (see initialize method above).  


# c.details
# cookie2.details

# c.eat

# p c.sugar
# p cookie2.sugar
# p cookie2.flour

# cookie2.flour = 9
# p cookie2.flour


