module HelperMethods
    def name_display
        name.capitalize
    end
end

class User
    attr_accessor :name
    include HelperMethods
end

class Car
    attr_accessor :name
    include HelperMethods
end

u = User.new
u.name = 'steph'

puts u.name_display

c = Car.new
c.name = "toyta"
puts c.name_display



