require "byebug"

def my_map (arr, &prc)

    new_arr = []
    arr.each { |ele| new_arr << prc.call(ele)}
    new_arr

end


def my_select (arr, &prc)

    new_arr = []
    arr.each { |ele| new_arr << ele if prc.call(ele) } 
    new_arr

end


def my_count (arr, &prc)
    i=0
    arr.each { |ele| i+=1 if prc.call(ele)}
    i
end

def my_any? (arr, &prc)
    
    arr.each { |ele| return true if prc.call(ele)}
    false
end

def my_all?(arr, &prc)

    arr.each { |ele| return false if !prc.call(ele)}
    true

end

def my_none?(arr, &prc)

    
    arr.each { |ele| return false if prc.call(ele)}
    true

end
