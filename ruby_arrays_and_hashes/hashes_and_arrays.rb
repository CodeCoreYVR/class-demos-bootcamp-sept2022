#hashes can store arrays as values for key value pairs
example_hash_with_array = {"abc" => [1,2,3], "xyz" => [4,5,6]}

#arrays can store hashes as elements

example_array_with_hashes = ["abc", {"a" => 1, "b" => 2 }, false, {"c" => 3}]

#Hash with array values
my_hash = { 'BC' => ['Vancouver', 'Richmond'], 'AB' => ['Edmonton', 'Calgary']}

my_hash.each do |key, values|
    puts "#{key}:#{values.join(', ')}"
end

student_list = {
    001 => {
        "name" => "Bob",
        "age" => 27,
        "hobbies" => ['programming', 'hiking', 'swimming']
    },
    002 => {
        "name" => "Sally",
        "age" => 27,
        "hobbies" => ['programming', 'drawing', 'swimming']
    }
}



