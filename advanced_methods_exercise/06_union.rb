# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.

# answer:

def union(*args)

    # so 1st I see we can concatenate arrays with +. Second the return of the inject is the array that get
    #accumulated!
    args.inject { |acc, el| acc + el}

end



# first try: not so bad. I just had to review how to utilize push (thought <<  could work, 
# but << probably only works for one element

# def union(*args)

#     arr = []
#     args.each { |ele| arr.push(*ele)}
#     arr

# end


p union(["a", "b"], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
p union(["x", "y"], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]
