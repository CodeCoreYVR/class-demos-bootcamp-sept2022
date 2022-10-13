# Arrays

a = [[1,2,3], true, "Hey", "Bye"]

#to access "Hey"
a[2]

#multi dimensional array
aa = [[1,2,3], [1,2,3], [1,2,3], [1,2,3], [1,2,3]]

aa[1] # [1,2,3] in index 1 (second array)
aa[1][2] #3 the second index in the second array

#=======Array Methods=======>

#=====Add to end of array====>
# .push
a.push([4,5,6])
# p a

# << 
#shovel operator
a << "Hola"
# p a

#====Remove from end of array=====>
#.pop
p a
a.pop
p a


#.include?

a3 = [1,2,3]
# p a3.include?(4) #false because the array does not include the value 4
# p a3.include?(2) #true

#get the number of elements in an array:

# p a3.count
# p a3.size
# p a3.length

#to change a multidimensional array to a one dimensional array
multi_array = [[1,2,3], [4,5,6], [7,8,9,10], [11,12,13]]
# p multi_array.flatten #returns a new array with one dimensional elements
# p multi_array #the original array is not mutated

farr = [1,2,3,[3,4,5,[6,7,8]],9,10]
p farr.flatten(1) #this will flatten by one dimension to give [1, 2, 3, 3, 4, 5, [6, 7, 8], 9, 10]

#====Add and remove from beginning of array======>

#shift - removes the first element in the array and returns the removed element
#permanantly mutates the original array

a4 = ['a','b','c','d','e']

p a4.shift
p a4

#unshift adds the value given in the argument at the beginning of the array
# returns the array with the new value appended and permanently mutates the original array
p a4.unshift('hello')
p a4

#drop can dropt the number of element given as an argument
p a4.drop 2 #returns a new array without the first 2 elements
p a4 #does not permanently mutate the array

#you can also use delete_at 0 to delete the first element

#convert a string into an array of words:
# .split
str = "Hello everyone, why are you laughing?"
p str.split(' ') #["Hello", "everyone,", "why", "are", "you", "laughing?"] new array created
p str #does not mutate original string

#convert an array into a string
a5 = ["Hello", "everyone,", "why", "are", "you", "sleeping?"]
p a5.join(' ') #creates a new string of words with a space in between each word
p a5 #does not mutate the original array

#Swap elements
a6 = ['Hello', 'CodeCore', 'students']
a6 = a6[1], a6[2], a6[0] 
p a6

#Replace elements based on their index position
a7 = [0,1,2]
a7[0..1] = [4,4,4]
p a7

#to see in which index position the value resides
p a6.index('students') #this should return index 1 where 'students' now resides

a8 = ['a','b','c']
a8[0], a8[1] = a8[1], a8[0]
p a8
