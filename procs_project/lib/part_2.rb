require "byebug"
def reverser(str, &prc)
    str.reverse!
    prc.call(str)
end

def word_changer(str,&prc)
    new_sent = []
    str.split.each { |word| new_sent << prc.call(word)}
    new_sent.join(" ")
end

def greater_proc_value(n, prc1, prc2)
    res1 = prc1.call(n)
    res2 = prc2.call(n)

    if res1 > res2 
        res1
    else
        res2
    end

end

def and_selector (arr, prc1, prc2)
    new_arr = []
    arr.each { |ele| new_arr << ele if prc1.call(ele)&&prc2.call(ele)}
    new_arr
end

def alternating_mapper (arr, prc1, prc2)
    new_arr = []
    arr.each_with_index do |n, i|
        if i.even? 
            new_arr << prc1.call(n)
        else
            new_arr << prc2.call(n)
        end
    end
    new_arr
end