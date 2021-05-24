require "byebug"

def select_even_nums(arr)

    arr.select(&:even?)
    
end

def reject_puppies (arr)

     arr.reject {|dog| dog["age"]<=2}

end

def count_positive_subarrays (arrs)

    arrs.count { |arr| arr.sum>0}

end

def aba_translate(str)
    vws="aeiou"
    temp_arr=str.split("").map do |letter|  
        if vws.include?(letter) 
            letter+"b"+letter 
        else 
            letter
        end
    end
    temp_arr.join("") 
end

def aba_array(arr)

    arr.map { |ele| aba_translate(ele)}

end
