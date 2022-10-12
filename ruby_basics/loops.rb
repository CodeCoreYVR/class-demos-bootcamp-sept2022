counter = 1

# while counter < 11
#     puts "I'm a counter at #{counter}"
#     counter += 1 #counter++
# end

#numbers 1-50
# num = 1

# while num <= 50
#     puts "#{num}"
#     num += 1 #num++
# end

# until counter > 5
#     print "this is the until loop at counter: #{counter}"
#     counter += 1
# end

#break

# puts "How many times should I loop?"
# num = gets.to_i

# i = 0

# while i < num
#     puts "Hello #{i}"
#     i += 1
#     break if i > 5
# end

# x = 0
# loop do
#     puts x
#     x += 1
#     break if x == 13
# end

# FOR LOOP

# for number in 1..10
#     puts number
# end

# 10.times { puts "Hello class" }

# 10.times do
#     puts "Hello Class"
# end

for number in (1..100).step(5)
    puts number
end

# This will output 1,6,11,16... etc.
# 10.times{puts "Hello CodeCore"}

puts 1.is_a? Integer
puts 1.is_a? String
puts "asdf".is_a? Integer
puts "asdf".is_a? String
