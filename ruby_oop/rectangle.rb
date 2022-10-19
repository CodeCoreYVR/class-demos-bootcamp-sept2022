class Rectangle
    attr_accessor :width, :height

    def initialize(width=0, height=0)
        @width, @height = width, height
    end

    def area
        width * height
    end

    def is_square?
        width == height
    end
end

r = Rectangle.new(3,4)

puts r.area
puts r.is_square?

r2 = Rectangle.new(2,2)
puts r2.area
puts r2.is_square?

