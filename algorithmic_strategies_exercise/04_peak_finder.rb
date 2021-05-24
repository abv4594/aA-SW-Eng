# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.
def peak_finder(arr)
    
    peaks = [] # peaks store the resulting array with the peaks

    peaks<< arr[0] if arr[0]>arr[1] # we check for the first element

    

    
    arr[1..-2].each_with_index do |num, id|  # ... and loop starting from the second - till the one before the last
        peaks << num if num>arr[id] && num>arr[id+2] # we check the peak condition 
        # important: the ids are from the sub-array arr[1..-2]. The original array has one element more in each edge
        # so arr[id] is actually checking one number to the left (-1) in the orignal array arr
    end

    peaks<<arr[-1] if arr[-1]>arr[-2] # we check for the last one

    peaks
end


p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]


