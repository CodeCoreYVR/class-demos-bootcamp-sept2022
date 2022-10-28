require "minitest/autorun"
require "./Rectangle.rb"

class RectangleTest < MiniTest::Test
    def test_area
        #GIVEN
        rectangle = Rectangle.new(2,10)

        #WHEN
        area = rectangle.area

        #THEN
        assert_equal(20, area)
    end

    def test_is_square?
        #GIVEN
        rectangle = Rectangle.new(2,2)

        #WHEN
        square = rectangle.is_square?

        #THEN
        assert_equal(true, square)
    end

end


