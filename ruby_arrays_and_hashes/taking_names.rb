#Solution 1

names = []

while name = gets.chomp
    if name == 'exit'
        break
    else
        names << name
    end
end


names.each do |x|
    p x.capitalize
end

#alternative way of writing the above:
# names.each { |x| p x.capitalize }

#Solution 2

# names = []
# name = gets.chomp
# while name != 'exit'
#     p 'type in name'
#     names << name.capitalize
#     name = gets.chomp
# end

# p names




