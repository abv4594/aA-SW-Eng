# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)

    new_str = "" # will store the resulting string
    char_count = 0 # will count the number of repeating chars 

    str.each_char do |char| #iterate over the string

        if new_str[-1] != char # if the last element of the newstring is not the carachter - it means it is new

            new_str += char # so we add the carachter

            char_count = 1 # set the count of the caracther to 1 again

        else # it means it is a repeating carachter

            char_count += 1 # we increment the counter of the carachter

            if char_count > 2 # it means there is already a number there
                new_str[-2] = char_count.to_s # so we replace
            else
                # If not, I need to insert the number
                new_str = new_str[0..-2] + char_count.to_s + new_str[-1]
            end

            
        end

    end

    new_str

end








# def compress_str(str)

#    ind=0
#    arr=[]
#    arr[ind]=""

#    str.split("").inject do |acc, el|
#         arr[ind] += acc
#         if el != acc
#             ind += 1
#             arr[ind] = "" # set next element as string
#         end
#         #p arr
#         el
#     end

#     arr[ind] += str.split("")[-1]

#     new_arr = arr.map do |word|
#         if word.length == 1
#             word
#         else
#             word.length.to_s + word[0]
#         end
#     end

#     new_arr.join()

# end


p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
