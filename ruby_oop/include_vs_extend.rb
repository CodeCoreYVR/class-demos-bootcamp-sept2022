=begin
MIXINS
Modules have another, wonderful use. At a stroke, 
they pretty much eliminate the need for multiple inheritance, 
providing a facility called a mixin. A module can't have instances, 
because a module isn't a class. However, you can include a module within a class definition. 
When this happens, all the module's instance methods are suddenly available as methods in the 
class as well. They get mixed in. In fact, mixed-in modules effectively behave as superclasses.
=end

module AwesomeMethods
    def greeting
        p "Hello world"
    end
end

class Abc
    include AwesomeMethods #this will allow the methods to be included for instances of the class
end

a = Abc.new
a.greeting #Hello World
# Abc.greeting #undefined method

class Xyz
    extend AwesomeMethods #this will allow the methods to be included for the class itself
end

x = Xyz.new
# x.greeting #undefined method
Xyz.greeting #Hello world





