=begin
    Write code that takes an array like the one below and prints out a hash whose 
    keys are symbols from the array and the value is the character count.
=end

arr = ["hello", "greetings", "hola", "hi"]

h = {}
arr.each do |element|
 h[element.to_sym] = element.length
end
p h
