# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

def bubble_sort(arr)

    sorted = false # we assume it is not sorted at first. Loop has to run.
    
    while !sorted 

        sorted = true #once inside the loop we assume this is the last time
    
        arr[0...-1].each_with_index do |num, idx| # go to the one before the last
           
            if num > arr[idx+1] # if it is not sorted
                sorted = false # only if there are elements out of order we run again
                arr[idx], arr[idx+1] = arr[idx+1], arr[idx] #switch in the array
            end
        
        end
    
    end

    arr
    
end

p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]