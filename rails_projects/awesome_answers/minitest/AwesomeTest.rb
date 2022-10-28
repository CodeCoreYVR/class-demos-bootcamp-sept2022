require "minitest/autorun"

class AwesomeTest < MiniTest::Test
    #Given we have this method
    #When we execute this method
    def test_something
        #something to test
        #Then we test if the outcome is what we expected
        assert_equal(3, 1+1)
    end


    def test_something_else
        assert_equal(3, 1+2)
    end
end

#to run this file we execute it with ruby
#remember to cd into the minitest directory: ruby AwesomeTest.rb



