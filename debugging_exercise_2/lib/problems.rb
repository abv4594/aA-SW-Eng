# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(n)
    
    # remember to use downto
   
    n.downto(2) do |i|
        return i if isprime?(i) && n % i == 0
    end

end

def isprime?(n)
    return false if n<2
    (2...n).none? { |i| n % i == 0}
end

def unique_chars?(str)
    count = Hash.new(0)
    str.split("").each { |char| count[char] += 1}
    count.values.each { |v| return false if v>1 }
    return true
end

def dupe_indices(arr)
    hash = Hash.new {|hash, k| hash[k]=[]}
    arr.each_with_index { |ele, i| hash[ele]<<i}
    hash.select {|k,v| v.length > 1}
end

def ana_array(arr1, arr2)

    h1=Hash.new(0)
    h2=Hash.new(0)

    arr1.each {|ele| h1[ele]+=1}
    arr2.each {|ele| h2[ele]+=1}

    h1 == h2 # we can compare hash this way!

end





