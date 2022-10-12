if 17 > 15
    puts "this is true and will print"
end

if 10 > 15
    puts "this is not true and woll not print"
end

if(10 > 15)
    puts "this is not going to print"
elsif(10 > 11)
    puts "this is also not going to print"
else
    puts "this will print because other conditions not met"
end

#inline conditionals
temp = 17
puts "It's cold" if temp < 20

#unless
puts "It's not above 15" unless temp > 15

#same as above
unless temp > 15
    puts "It's not above 15"
end

#ELSE statement

if false
    puts "condition is false"
else
    puts "condition is true"
end

#elseif
puts "how old is your car?"
year = gets.chomp.to_i

if year <= 1
    puts "your car is the future"
elsif year > 2 && year < 5
    puts "car is new"
elsif year == 6
    puts "good year"
else
    puts "car is old"
end



