class Vector
    attr_accessor(:x, :y)

    def initialize(x,y)
        @x = x
        @y = y
    end

    def length
        Math.sqrt(@x**2 + @y**2)
    end

    def to_s
        "Vector: (#{@x},#{@y})"
    end


end


