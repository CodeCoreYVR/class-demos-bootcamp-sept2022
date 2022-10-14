def what_is_it(thing)
    if [String, Array, Integer].include?(thing.class)
        thing.class
    else
        "Something else"
    end
end

p what_is_it "string"
p what_is_it 4
p what_is_it [1,2,3,4]
p what_is_it 5.3



