require "byebug"

def zip(*arrays)

    # arrs will contain an array of the arguments
    # arrs = [[1,2,3], [a,b,c]]

    # len = arrays[0].length

    # new_arr = Array.new(len) { |arr| arr = []}
    
    # arrays.each_with_index do |arr,idx1|

    #      arr.each_with_index do |ele,idx2|

    #          new_arr[idx2] << ele

    #      end

    # end

    # new_arr

    arrays.transpose

end


def prizz_proc(arr, prc1, prc2)

    arr.select { |ele| (prc1.call(ele) && !(prc2.call(ele))) || (!(prc1.call(ele))&&prc2.call(ele))}

end

def zany_zip(*arrs)

    #finding the longest array length in the set

    longest = arrs.max {|a,b| a.length<=>b.length}
    max_length = longest.length

    #completing with nil 

    arrs.each do |arr|

        until arr.length == max_length
            arr << nil
        end
    end

    #transposing arrs

    arrs.transpose

end

def maximum(arr,&prc)

    max_ind = 0 # we assume prc.call(arr[0]) to be the largest

    (1...arr.length).each do |idx|

        if prc.call(arr[idx]) >= prc.call(arr[max_ind])

            max_ind = idx

        end


    end

    arr[max_ind]


end

def my_group_by(arr, &prc)

    group_by = Hash.new {|h,k| h[k]=[]}

    arr.each {|ele| group_by[prc.call(ele)]<<ele}

    group_by

end

def max_tie_breaker(arr, prc1, &prc2) #prc2 is the block

    max_ind = 0 # assume that prc2.call(arr[0]) is the max

    (1...arr.length).each do |idx|

        # #debugger

        test1 = (prc2.call(arr[max_ind])) <=> (prc2.call(arr[idx]))

        if test1 == -1 
             max_ind=idx
        elsif test1 == 0
            test2 = (prc1.call(arr[max_ind])) <=> (prc1.call(arr[idx])) 
            if test2 == -1
                max_ind=idx
            end
        end
    end

    arr[max_ind]

end

def silly_syllables(sent)

    vowels = "aeiou"

    words = sent.split(" ")

    words.each do |word|

        count_vowels = word.split("").count {|letter| vowels.include?(letter) }

        if count_vowels >= 2
            #remove first letters till vowel 
            vowel_found = false
            until vowel_found 
                if !(vowels.include?(word[0]))
                    word[0]=""
                else
                    vowel_found = true
                end
            end
            #remove last letters till vowel  
            vowel_found = false
            until vowel_found 
                if !vowels.include?(word[-1])
                    word[-1]=""
                else
                    vowel_found = true
                end
            end
        end
    end

    words.join(" ")

end






























