def add(first: 0, second: 1)
    #the first argument has a default value of 0
    #the second argument has a default value of 1
    p first + second
end

# add
# add(first: 4, second: 5)

add(second: 30)
#add(4,5) #this will raise an exception because named arguments must be called by their names
add(first:4)


