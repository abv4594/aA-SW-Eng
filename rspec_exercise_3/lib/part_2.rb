def element_count(arr)

    count_arr = Hash.new(0)

    arr.each {|ele| count_arr[ele]+=1}

    count_arr

end

def char_replace!(str, hsh)

    str.each_char.with_index do |char,idx|

        str[idx]=hsh[char] if hsh.keys.include?(char)

    end

    str

end

def product_inject(arr)

    arr.inject(&:*)

end
