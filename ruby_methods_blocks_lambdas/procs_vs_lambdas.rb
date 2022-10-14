#Lambdas are part of the Procs class, it's just a special kind of Proc

#Differences between Procs and lambdas

a = Proc.new {|x,y| puts "I don't care about arguments" }

# a.call(4) #even if there are not the expected amount of arguments, 
#a proc will not raise an an exception (throw an error)
#but a lambda would

#Procs and Lambdas return differently

#A lambda returns like a regular method
#Procs will return from the method enclosing the Proc

def test_procs_and_lambdas
    yield
    puts "hello"
end

l = lambda do
    puts "lambda"
    return
end

p = Proc.new do
    puts "proc"
    return
end

# test_procs_and_lambdas(&l)
test_procs_and_lambdas(&p)

#Procs are selfish - if it encounters its own return, it will stop right there and ignore the return
#of the method that called it
#without its own return, it will act as a regular code block that is yielded

#1. Differences in how to create them:
#lambdas are defined with ->{} / lambda{} and procs are defined with Proc.new{}
#2. Proc doesn't care about arguments and lambdas do
#3. Proc returns from its own return and does not care about the rest of the code of the method that called it




