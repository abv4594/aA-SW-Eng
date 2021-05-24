# Write a method, multi_dimensional_sum(array), that accepts a multidimensional array as an arg 
# and returns the sum of all numbers in the array.

# I forgot there was a method flatten and my own flatten method

def multi_dimensional_sum(array)

    puts "With the built-in flatten method:"
    puts array.flatten.inject { |acc, num| acc + num }

    puts "With my flatten method:"
    puts my_flatten(array).inject { |acc, num| acc + num}

    return "----"

end

def my_flatten(array)

    cont = true
    new_arr = [] 
    
    while cont   
        new_arr = array.inject([]) { |acc, ele| acc.push(*ele)}
        if new_arr.length == array.length
            cont = false # stop interacting
        else # repeat
            array = new_arr
            new_arr = []
        end
    end

    new_arr

end


arr_1 = [
    [4, 3, 1],
    [8, 1],
    [2]
]

p multi_dimensional_sum(arr_1)    # => 19

arr_2 = [
    [ [3, 6], [7] ],
    [ [5, 2], 1 ]
]

p multi_dimensional_sum(arr_2)    # => 24
