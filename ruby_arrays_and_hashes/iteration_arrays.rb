arr = ['a','b','c','d']

#use for loop
# for element in arr do
#     # puts element
# end

arr2 = [1,2,3,4,5,6,7,8]

#.each
#one of the most common ways to iterate over an array
# the method expects a block with an argument
#blocks are a new concept here
#blocks are a piece of code that you can pass in as an argument to a method
# blocks start after the `do` statement... arguments are written inside of the pipes | |

# In ruby, there is no such things as functions, instead ruby just uses methods. 
# And methods may take a block of code as an argument. We no longer pass functions around. We pass blocks around

# do end, is similar to {} in JS. so similar scope as it would be in JS


#The argument x represents the value of each element in the array in this case

# arr2.each do |x| # the block starts after the `do` statement. Arguments are within the two pipes `|x|`. Multiple arguments are seperated by commas `|x,y|`
#     y = x * 2
#     p y
# end

# arr2.each do |element|
#     y = element *2
#     p y
# end

#=====Build, loop, print======>

arr3 = [1,2,3,4,5]

# arr3.each do |element|
#     y = element**2
#     puts y
# end

# ['a','b',2,'d', false].map do |element|
#     p element.class
# end

# ['a','b',2,'d', 'e'].map.with_index do |element, index|
#     p "element: #{element}, index: #{index}"
# end

# A nice thing about ruby is that you don’t need to explicitly return.  The last line in a block will automatically return
# remember... everything in ruby is an object... the .map method is an object that has a method called .with_index
# calling .with_index will give you the map method but the block has an additional argument as the index

#===Printing off multiple dimensions

multi_arr = [[1,7,3], [4,4,6], [7,2,9]]

multi_arr.each do |sub_arr|
    sub_arr.each do |value|
        p value * value
    end
end

