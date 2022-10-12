# two different numbers: integer and float
# 1
# 10
# 100
# 100_000_000  # same as writing 100000000. ruby ignores _ as spaces.

#INTEGERS
# 5/2 = 2 #because ruby is given integers, the answer will also be an integer

# #FLOAT
# 5.0/2.0 = 2.5 #ruby will see the original values as floats and will return a float

# "50".to_i #-> string to integer
# "50".to_f #-> string to float

# #To the power of
# a = 5
# b = 3 ** a

#prompt user for multiplication result
# puts "Please give me a number"
# number_1 = gets.chomp.to_i
# puts "Please give me another number"
# number_2 = gets.chomp.to_i
# puts number_1 * number_2

#Logical operators
# || OR operator
# && AND operator

=begin
true && false => false
false && false => false
true && true => true
false && true => false

true || false => true
false || false => false
true || true => true
false || true => true

!= not strictly equal
== also compares data type to be true (strict equality)
"10" == 10 -> will return false because string of 10 is not equal to integer 10
however 10 == 10.0 are both numbers, so this will return true, instead, use .eql that is strictly true
and differentiates between integer and float
puts 10.eql?(10.0) #will return false because float does not equal integer value

=end



