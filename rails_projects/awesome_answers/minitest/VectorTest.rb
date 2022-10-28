require "minitest/autorun"
require "./Vector.rb"

class VectorTest < MiniTest::Test

    def test_length
        #GIVEN
        #a vector of (3,4)
        vector= Vector.new(3,4)

        #WHEN
        #an action is triggered
        #in this case the length method is called
        length_of_vector = vector.length

        #THEN
        #verify its final state
        assert_equal(5, length_of_vector)
    end

    def test_to_s
        #GIVEN
        vector = Vector.new(1,1)

        #WHEN
        to_s = vector.to_s

        #THEN
        assert_equal("Vector: (1,1)", to_s)
    end

end