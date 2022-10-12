sum = 0

puts "Enter a number to add up to a sum, or type exit for the sum"
input = gets.chomp

until input == "exit"
    puts "Enter a number to add up to a sum, or type exit for the sum"
    num = input.to_i
    sum += num
    input = gets.chomp
end

puts "sum is #{sum}"
