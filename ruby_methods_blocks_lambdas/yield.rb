#yield is a Ruby keyword that calls a block when you use it
#yield is like calling the block. Almost like a callback function. It will call the last expression from the block


def my_yield_method
    p "I'm a yield method"
    yield if block_given?
    puts "goodbye"
end

# my_yield_method

# my_yield_method { puts "Hello World"}

# my_yield_method do
#     puts "I'm a block"
# end

def print_once
    yield #expects a block to be passed
end

# print_once #if block is not given, an error will be raised saying "block not given"
#it expects a block to be given because of the yield keyword, and in this case the method
#wants to implicitly return yield because it is the last expression

# print_once { puts "Block is given" }

def my_method
    x=15
    yield(x) if block_given?
    puts "goodbye"
end

my_method do |my_arg|
    puts "I received #{my_arg} from the method"
end

def print_twice
    yield
    yield
end

print_twice {puts "Block is being printed twice"}


