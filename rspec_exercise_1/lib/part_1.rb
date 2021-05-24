def average (n1, n2)
    (n1+n2)/2.0
end

def average_array(arr)

    (arr.inject { |acc,n| acc + n})/arr.length.to_f
    
end

def repeat(str, n)

    str*n

end

def yell(str)

    str.upcase + "!"

end

def alternating_case(str)
    
    arr = []
    
    arr = str.split.map.with_index do |word, i|
        if i%2==0
            word.upcase
        else 
            word.downcase
        end
    end

    arr.join(" ")

end

