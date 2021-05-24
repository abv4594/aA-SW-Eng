require "byebug"

def palindrome? (str)
    i=0
    (0...str.length).each do |i|
        return false if str[i] != str[-(i+1)]
    end
    return true
end

def substrings (str)
    i = 0 # outer loop
    arr = []
    debugger
    
    while i < str.length do 
        arr << str[i]
        j = i + 1 # inner loop starts in the next letter
        while j<str.length do
            arr << str[i..j]
            j += 1
        end
    i += 1
    end
    arr
end

def palindrome_substrings(str)

    # get all substrings

    arr = substrings(str)

    new_arr = [] # will store the result

    arr.each do |ele|

        new_arr << ele if ele.length > 1 && palindrome?(ele)

    end

    new_arr


end
