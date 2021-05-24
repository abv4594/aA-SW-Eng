def is_prime?(num)

    return false if num<2

    (2...num).none? {|n| num % n == 0}

end

def nth_prime(n)

    i = 0
    num = 2

    while true

        i+=1 if is_prime?(num)

        return num if i==n

        num+=1

    end
    

end

def prime_range(min,max)

    (min..max).select {|num| is_prime?(num)}

end



