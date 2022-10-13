# => ruby rocket or hash rocket
#keys in a hash can be strings, integeres, or symbols

h = {"string1" => 1, 4 => "string", :symbol => 1, "arr" => [1,2,3,4] }

grades = {
    "Jane Doe" => 10,
    "Jim Doe" => 5,
    :lisa => 12,  #this can also be written as lisa: 12
    "lisa" => 500
}

# p grades["Jane Doe"]
# grades["Jane Doe"] = 20
# p grades["Jane Doe"]

p grades[:lisa]
grades[:lisa] = 20
p grades[:lisa]

#Doc hunt methods

#to return an array of a hash's keys

p grades.keys

#to return an array of a hash's values

p grades.values


