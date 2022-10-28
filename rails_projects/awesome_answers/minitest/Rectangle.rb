class Rectangle
    def initialize(length, width)
        @length = length
        @width = width
    end

    def area
        @length * @width
    end

    def is_square?
        @length == @width
    end

end


