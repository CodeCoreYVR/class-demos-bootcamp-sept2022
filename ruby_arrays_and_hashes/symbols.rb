#symbol is denoted with colon in front :im_a_symbol
#symbols are immutable but the value they point to can be mutable

#change key into symbol or string

p "hello".to_sym #this will change it into a symbol
p :hello.to_s #this will change into a string

p "bye".intern #will change string to symbol if symbol does not already exist

#writing a symbol

# :i_am_a_symbol
# :i-am-not-a-symbol => invalid
# :"this can also work" => valid but not good practise

# a symbol is an immutable string. You create them using the colon :
# :hello #symbol of hello

# symbols themselves are a value
#if you had :hello.class it will return => Symbol

students = {
    lisa: 30
    #:lisa => 30
}

#symbols are immutable, but their values are mutable

grades = {
    "Jane Doe" => 10,
    "Jim Doe" => 15,
    :lisa => 12,
    "lisa" => 30 #this key will be different from the symbol :lisa
}

grades[:lisa] = 20

p grades[:lisa]

# A symbol takes one memory spot to always reference that same 
# exact symbol anywhere within your program.  When you load your program, 
# you use some RAM up to declare a variable and the variables value sits in 
# memory somewhere. So every time you reference that symbol, it will go back 
# to that same spot in memory.

a = {
    :hello => "world"
}

b = {
    :hello => "apple"
}

# p a[:hello] # => "world"
# p b[:hello] # => "apple"

#the symbol :hello is the exact same symbol, but ruby knows it belongs to a specific hash, and based on that hash it points to a different value

#Hash that store personal info

personal = {
    name: "Steph",
    job: "instructor",
    career: "web development"
}

#Try in irb or pry:
"hello".object_id #some number
"hello".object_id #different number
:hello.object_id #serial number
:hello.object_id #same serial number as previous symbol

#In other words, every time an object is created, it creates a spot in memory, 
#so for the string it creates a new id every time. Symbols are not recreated,
#they are more efficient and faster to grab, because they are always referencing
#the same thing



